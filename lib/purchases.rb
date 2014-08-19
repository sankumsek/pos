class Purchase < ActiveRecord::Base
  belongs_to(:product)
  belongs_to(:history)
  #has_and_belongs_to_many :products
  # has_many :products

  def total
    self.quantity * self.product.price
  end

  def self.report_by_date start_date, end_date
    amount = 0
    self.where("created_at BETWEEN ? AND ?", start_date, end_date).each do |pur|
       amount += pur.total
    end
    amount
  end
end

