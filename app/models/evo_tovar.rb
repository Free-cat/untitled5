class EvoTovar < ApplicationRecord
  self.inheritance_column = :_type_disabled
  has_secure_token :uuid
  validates :costPrice, :price, :code, :name, :quantity, presence: true

  belongs_to :user, optional: true
end
