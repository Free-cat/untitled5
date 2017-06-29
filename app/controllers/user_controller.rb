class UserController < ApplicationController
  before_action :check_token_params, only: [:token]
  before_action :chech_evotoken, only: [:create]

  def token
    @current_user = User.where(:userUuid => params[:userUuid]).take

    if @current_user.blank?
          user = User.new(
              :userUuid => params[:userUuid],
              :tokenEvo => params[:token])
          user.save!
          render :json => {:result => :ok}, :code => 200
    else
      User.find_by(:userUuid => params[:userUuid]).update_attribute(:tokenEvo, params[:token])
      User.find_by(:userUuid => params[:userUuid]).regenerate_token
      render :json => {:result => :ok, :params => request.headers["X-Authorization"]}, :code => 200
    end
  end

  def create
    @current_user = User.where(:userUuid => params[:userUuid]).take
    if @current_user.login.blank? || @current_user.password.blank?
      User.find_by(:userUuid => params[:userUuid]).update_attribute(:login, params[:login])
      User.find_by(:userUuid => params[:userUuid]).update_attribute(:password, params[:password])
      render :json => {:userUuid => params[:userUuid], :token => User.find_by(:userUuid => params[:userUuid]).token}
    else
      if @current_user.login == params[:login] || @current_user.password == params[:password]
        render :json => {:errors => {:error => '2005'}}, :code => 409
      end
    end
  end

  def verify
    require 'rest-client'
    response = RestClient.post 'http://admin.carex.su/user_sessions.json', {'user_session[login]' => 'admin', 'user_session[password]' => 'Susadi0123455'}
    @current_user = User.where(:userUuid => params[:userUuid]).take
    response2 = RestClient.get('http://admin.carex.su/supplier_order_items/income.json', {:cookies => response.cookies})

    @test = JSON.parse(response2.body)

    render :json => {:Cookie => @test.at(5)['Id']}
  end

  private
  def chech_evotoken
    @current_user = User.where(:userUuid => params[:userUuid]).take

    if !(@current_user.tokenEvo == request.headers["X-Authorization"])
      render :json => {:errors => {:error => '1001'}}, :code => 401
    end

    if (params[:userUuid].blank?)
      render :json => {:errors => {:code => 2002, :reason => "missing", :subject => "userUuid"}}, :code => 400
    end

    if (params[:login].blank?)
      render :json => {:errors => {:code => 2002, :reason => "missing", :subject => "login"}}, :code => 400
    end

    if (params[:password].blank?)
      render :json => {:errors => {:code => 2002, :reason => "missing", :subject => "password"}}, :code => 400
    end
  end

  private
  def check_token_params
    if (params[:userUuid].blank?)
        render :json => {:errors => {:code => 2002, :reason => "missing", :subject => "userUuid"}}, :code => 400
    end
    if (params[:token].blank?)
        render :json => {:errors => {:code => 2002, :reason => "missing", :subject => "token"}}, :code => 400
    end
  end
end
