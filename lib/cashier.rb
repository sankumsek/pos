class Cashier < ActiveRecord::Base
  has_many(:histories)

  def self.login login
    Cashier.where(:login => login)
  end

  def self.total_checkout start_date, end_date
    checkouts = []
    self.all.each do |cashier|
      total = cashier.histories.where("created_at BETWEEN ? AND ?", start_date, end_date).count
      checkouts << [cashier.name, total]
    end
    checkouts
  end
end
