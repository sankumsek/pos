require 'spec_helper'

describe 'Customer' do
  it 'takes input from user and creates a new record' do
    Customer.create(:name => 'Matt')
    expect(Customer.all.first.name).to eq "Matt"
  end
end
