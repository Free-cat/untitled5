class User < ApplicationRecord
  has_secure_token :token
  validates :tokenEvo, :userUuid, presence: true

  has_many :evo_tovars
end
