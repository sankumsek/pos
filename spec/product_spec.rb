require 'spec_helper'

describe 'Product' do
  it 'takes input from user and creates a new record' do
    Product.create(:name => 'Cheeseburger', :price => 2.50)
    expect(Product.all.first.name).to eq "Cheeseburger"
    expect(Product.all.first.price).to eq 2.50
  end
end
