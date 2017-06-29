class ProductsController < ApplicationController

  def loadProduct
    require 'rest-client'
    response = RestClient.post 'http://admin.carex.su/user_sessions.json', {'user_session[login]' => 'admin', 'user_session[password]' => 'Susadi0123455'}
    response2 = RestClient.get('http://admin.carex.su/supplier_order_items/income.json', {:cookies => response.cookies})


    @test = JSON.parse(response2.body)

    @user = User.first
    @test.each do |job|
      evo = EvoTovar.new(costPrice: job['clientFirst_cost'], price: job['clientPrice'], code: job['Oem'], name: job['DetailName'], quantity: job['Qnt'])
      evo.save!
    end

    @x = EvoTovar.all

    render :json => @x


  end

  def createProduct

  end

  def searchProduct

  end

end
