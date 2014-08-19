class History < ActiveRecord::Base
  belongs_to(:customer)
  belongs_to(:cashier)
  has_many(:purchases)
end
