require './pos_helper'
require './pos_method'

def menu
  choice = nil
  until choice == 'Ex'
    exit_print
    left_center("[Ca]shier Menu")
    left_center("[Pr]oduct Manager Menu")
    left_center("[Cu]stomer Menu")
    ws
    left_center("[Ch]eckout")
    ws
    left_center("List:")
    left_indent("[It]ems")
    left_indent("[Sh]oppers")
    left_indent("[Wo]rkers")
    left_indent("[Tr]ansactions")
    left_indent("[Pu]rchases")
    choice = prompt(" ")
    case choice
    when "It"
      list_items
      restart
    when "Sh"
      list_shoppers
      restart
    when "Ch"
      checkout
      restart
    when "Ex"
      exit
    when "Wo"
      list_workers
      restart
    when "Tr"
      list_histories
      restart
    when "Pu"
      list_purchases
      restart
    when 'Pr'
      header
      exit_print
      left_center("Add:")
      left_indent("[Pr]oduct")
      left_indent("[Lo]gin")
      left_indent("[Cu]stomer")
      ws
      left_center("Show:")
      left_indent("[To]tal Sales by Date")
      left_indent("[Ch]eckouts by Cashier and Date")
      left_indent("[Sa]es by Product")
      left_indent("[Re]turns by Product")
      ws
      left_center("[Ma]in Menu")
      manager_choice = prompt(" ")
      if manager_choice == "Pr"
        add_product
        restart
      elsif manager_choice == "Lo"
        add_login
        restart
      elsif manager_choice == "Cu"
        add_customer
        restart
      elsif manager_choice == "To"
        sales_by_date
        restart
      elsif manager_choice == "Ch"
        checkouts_by_cashier
        restart
      elsif manager_choice == "Sa"
        sales_by_product
        restart
      elsif manager_choice == "Re"
        returns_by_product
        restart
      elsif manager_choice == "Ma"
        welcome
      else
        puts "Not a valid option"
        welcome
      end
    when 'Ca'
      header
      exit_print
      left_center("[Vi]ew Receipt")
      ws
      left_center("[Ma]in Menu")
      cashier_choice = prompt(" ")
      if cashier_choice == "Vi"
        list_histories
        hist_choice = prompt("Pick a history id")
        view_receipt(hist_choice)
        restart
      elsif cashier_choice == "Ex"
        exit
      elsif cashier_choice == "Ma"
        welcome
      else
        puts "Not a valid option"
        welcome
      end
    when 'Cu'
      header
      exit_print
      left_center("[Vi]ew Receipt")
      left_center("[Re]turn Items")
      ws
      left_center("[Ma]in Menu")
      customer_choice = prompt(" ")
      if customer_choice == "Vi"
        list_histories
        hist_choice = prompt("Pick a history id")
        view_receipt(hist_choice)
        restart
      elsif customer_choice == "Re"
        return_item
        restart
      elsif customer_choice == "Ex"
        exit
      elsif customer_choice == "Ma"
        welcome
      else
        puts "Not a valid option"
        welcome
      end
    else
      puts "Not a valid option."
      welcome
    end
  end
end

welcome
