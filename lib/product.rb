class Product < ActiveRecord::Base
  has_many :purchases

  def self.total_quantities
    totals = []
    self.all.each do |product|
      product_total = 0
      product.purchases.each do |purchase|
        if purchase.quantity != nil
          product_total += purchase.quantity
        end
      end
      totals << [product_total, product.name]
    end
    totals
  end

  def self.total_returns
    totals = []
    self.all.each do |product|
      product_total = 0
      product.purchases.where("quantity < '0' ").each do |purchase|
        product_total += purchase.quantity
      end
      totals << [product_total, product.name]
    end
    totals
  end
end

