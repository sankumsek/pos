require 'rspec'
require 'pg'
require 'active_record'
require 'shoulda/matchers'


require 'cashier'
require 'customer'
require 'product'
require 'purchases'
require 'history'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Cashier.all.each { |cashier| cashier.destroy }
    Customer.all.each { |customer| customer.destroy }
    Purchase.all.each{ |purchase| purchase.destroy }
    Product.all.each { |product| product.destroy }
    History.all.each { |history| history.destroy }
  end
end
