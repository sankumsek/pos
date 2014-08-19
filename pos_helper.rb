require 'active_record'
require 'shoulda/matchers'
require 'pry'

require './lib/cashier'
require './lib/customer'
require './lib/product'
require './lib/purchases'
require './lib/history'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def restart
  ws
  prompt(" ")
  welcome
end

def ws
  print "\n"
end

def prompt str
  print("#{str} - ")
  gets.chomp.capitalize
end

def center str
  if str.to_s.length % 2 == 0
    sp = " " * ((80 - str.length)/2)
    puts "#{sp} #{str} #{sp}"
  else
    sp = " " * ((81 - str.length)/2)
    puts "#{sp} #{str} #{sp}"
  end
end

def left_center str
    sp = " " * 30
    puts "#{sp} #{str} #{sp}"
end

def left_indent str
    l_sp = " " * 30
    puts "#{l_sp} >   #{str}"
end

def welcome
  system("clear")
  print ("\n\n")
  center("╭━━━╮╱╱╱╱╱╱╱╱╭━━━╮")
  center("┃╭━╮┃╱╱╱╱╱╱╱╱┃╭━╮┃")
  center("┃╰━╯┃╱╱╭━━╮╱╱┃╰━━╮")
  center("┃╭━━╯╱╱┃╭╮┃╱╱╰━━╮┃")
  center(" ┃┃╱╱╱╭╮┃╰╯┃╭╮┃╰━╯┃╭╮")
  center(" ╰╯╱╱╱╰╯╰━━╯╰╯╰━━━╯╰╯")
  print ("\n\n")
  menu
end

def header
  system("clear")
  print ("\n\n")
  center("╭━━━╮╱╱╱╱╱╱╱╱╭━━━╮")
  center("┃╭━╮┃╱╱╱╱╱╱╱╱┃╭━╮┃")
  center("┃╰━╯┃╱╱╭━━╮╱╱┃╰━━╮")
  center("┃╭━━╯╱╱┃╭╮┃╱╱╰━━╮┃")
  center(" ┃┃╱╱╱╭╮┃╰╯┃╭╮┃╰━╯┃╭╮")
  center(" ╰╯╱╱╱╰╯╰━━╯╰╯╰━━━╯╰╯")
  print ("\n\n")
end

def exit_print
    left_center("[Ex]it")
    print("\n")
end
