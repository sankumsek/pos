#listing stuff
def list_items
  Product.all.each do |product|
    left_center("#{product.id}.  #{product.name}  $#{product.price}")
  end
end

def list_shoppers
  Customer.all.each do |customer|
    left_center("#{customer.id}.  #{customer.name}")
  end
end

def list_workers
  Cashier.all.each do |cashier|
    left_center("#{cashier.id}.  #{cashier.login}  #{cashier.name}")
  end
end

def list_histories
  History.all.each do |history|
    left_center("#{history.id}.  Cu: #{history.customer_id} Ca: #{history.cashier_id} #{history.created_at}")
  end
end

def list_purchases
  History.all.each do |history|
    left_center("#{history.id}.  Cu: #{history.customer_id} Ca: #{history.cashier_id} #{history.created_at}")
  end
  hist_choice = prompt("Choose a history id")
  history = History.find(hist_choice)
  left_center("Ca: #{history.cashier.login} Cu: #{history.customer.name} On: #{history.created_at.to_s[0,10]}")
  history.purchases.each do |purchase|
    left_center("#{purchase.product.name}: #{purchase.quantity}")
  end
end

#editing and deleting stuff

#adding stuff
def add_product
  prod_name = prompt("Enter the product's name")
  prod_price = prompt("Enter the product's price")
  new_prod = Product.create({:name => prod_name, :price => prod_price})
  puts "#{new_prod.name} has been created"
end

def add_login
  cashier_login = prompt("Enter a new login")
  cashier_name = prompt("Enter the cashier's name")
  new_cashier = Cashier.create({:login => cashier_login, :name => cashier_name})
  puts "#{new_cashier.login}, #{new_cashier.name} has been created"
end

def add_customer
  customer_name = prompt("Enter a customer's name")
  new_customer = Customer.create({:name => customer_name})
  puts "#{new_customer.name} has been created"
end

def checkout
  cashier_login = prompt("Please enter your cashier login:")
  until  Cashier.find_by(:login => cashier_login) != nil
    cashier_login = prompt("Please enter your cashier login:")
  end
  cashier_id = Cashier.find_by(:login => cashier_login).id
  Customer.all.each do |customer|
    left_center("#{customer.id}.  #{customer.name}")
  end
  cust_id = prompt("And what is the customer's ID?")
  until  Customer.find_by(:id => cust_id) != nil
    cust_id = prompt("And what is the customer's ID?")
  end
  new_history = History.create({:customer_id => cust_id, :cashier_id => cashier_id})
  choice = "Y"
  until choice == "N"
    Product.all.each do |product|
     left_center("#{product.id}.  #{product.name}  $#{product.price}")
    end
    prod_id = prompt("Enter the product's id")
    until  Product.find_by(:id => prod_id) != nil
      prod_id = prompt("Enter the product's id")
    end
    quan = prompt("Enter the quantity")
    stuff = Purchase.create({:history_id => new_history.id, :product_id => prod_id, :quantity => quan})
    choice = prompt("Purchase another product, [Y]es [N]o?")
  end
  history_total = new_history.purchases.inject(0) { |sum, purchase| sum + purchase.total }
  left_center("The total is $#{history_total}.")
  receipt_check = prompt("View receipt? [Y]es/[N]o?")
  ws
  if receipt_check = "Y"
    view_receipt(new_history)
  end
end

#manager queries
def sales_by_date
  start_date = prompt("Enter start date:")
  end_date = prompt("Enter end date:")
  left_center("$#{Purchase.report_by_date(start_date, end_date)}")
end

def checkouts_by_cashier
  start_date = prompt("Enter start date:")
  end_date = prompt("Enter end date:")
  printout = Cashier.total_checkout(start_date, end_date)
  ws
  printout.each do |cash|
    left_center(cash.join(": "))
  end
end

def sales_by_product
  printout = Product.total_quantities
  ws
  printout.each do |top|
    left_center(top.join(" | "))
  end
end

def returns_by_product
  printout = Product.total_returns
  ws
  printout.each do |top|
    left_center(top.join(" | "))
  end
end

#cashier and customer stuff
def view_receipt(hist_id)
  hist = History.find(hist_id)
  left_center("Cashier: #{hist.cashier.name}")
  left_center("Customer: #{hist.customer.name}")
  left_center("Date: #{hist.created_at.to_s[0,10]}")
  ws
  hist.purchases.all.each do |purchaze|
    left_center("#{purchaze.quantity} #{purchaze.product.name} $#{purchaze.total}")
  end
  ws
  history_total = hist.purchases.inject(0) { |sum, purchase| sum + purchase.total }
  left_center("Total:  $#{history_total}")
end

def return_item
  list_histories
  hist_choice = prompt("Choose a history id")
  history = History.find(hist_choice)
  history.purchases.each do |purchase|
    left_center("#{purchase.id} #{purchase.product.name}: #{purchase.quantity}")
  end
  pur_choice = prompt("Choose a purchase id")
  purchace = Purchase.find(pur_choice)
  qua_choice = prompt("Choose an amount to return").to_i * -1
  ret_purchase = Purchase.create({:history_id => history.id, :product_id => purchace.product_id, :quantity => qua_choice})
  print "#{-ret_purchase.quantity} of #{ret_purchase.product.name} have been returned."
end
