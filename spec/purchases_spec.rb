require 'spec_helper'

describe 'Purchase' do
  it 'creates a new purchase record' do
    test_cust = Customer.new({:name => 'Customer Bob'})
    test_cash = Cashier.new({:login => '123'})
    test_history = History.create({:customer_id => test_cust.id, :cashier_id => test_cash.id})
    test_prod = Product.new({:name => 'burger', :price => 90.42})
    test_history.purchases.create({:product_id => test_prod.id, :quantity => 2})
    expect(Purchase.all.first.history_id).to eq test_history.id
  end
end

# transaction.purchases.new()

# list = List.new({:name => 'Epicodus stuff'})
# task = list.tasks.new({:name => 'learn Active Record'})
# list.save
# task.list
