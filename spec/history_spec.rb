require 'spec_helper'

describe 'History' do
  it 'inputs into record of histories table with the exception of date' do
    test_cust = Customer.new(:name => 'Customer Bob')
    test_cash = Cashier.new(:login => '123')
    History.create({:customer_id => test_cust.id, :cashier_id => test_cash.id})
    expect(History.all.first.customer_id).to eq test_cust.id
  end
end
