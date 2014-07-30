require './lib/contacts'
require './lib/phone'
require './lib/email'
require './lib/address'


def main_menu
  puts "'c' Create a new contact \n
  ------------------------- \n
  'z' Show all contacts \n
  ------------------------- \n
  'p' Add a new phone number \n
  'e' Add a new email \n
  'a' Add a mew address \n
  'd' Change a Contact \n
  ------------------------- \n
  'x' Exit"

  main_choice = gets.chomp

  if main_choice == 'c'
    new_contact
  elsif main_choice == 'z'
    show_contacts
  elsif main_choice == 'p'
    add_phone
  elsif main_choice == 'e'
    add_email
  elsif main_choice == 'a'
    add_address
  elsif main_choice == "d"
    change_contact
  elsif main_choice == 'x'
    puts "Goodbye"
  else
    puts "Sorry that choice was invalid"
  end
end

  def new_contact
    puts "Enter a name"
    input_name = gets.chomp
    puts "Enter a phone number"
    input_phone_num = gets.chomp
    puts "Enter an email address"
    input_email = gets.chomp
    puts "Enter an address"
    input_address = gets.chomp
    newContact = Contact.new(input_name)
    newContact.save
    newContact.add_phone(input_phone_num)
    newContact.add_email(input_email)
    newContact.add_address(input_address)
    puts "Created a New Contact"
    puts "\n\n"
    main_menu
  end

  def add_phone
    puts "Which name would you like to add a phone number for?"
    Contact.all_names
    puts "Type contact's name or press 'x' to exit"
    user_choice = gets.chomp
    Contact.all.each_with_index do |item, index|
      if user_choice == item.name
        puts "Enter phone number"
        user_phone_num = gets.chomp
        item.add_phone(user_phone_num)
      end
    end
    main_menu
  end

  def add_email
    puts "Which name would you like to add an email address for?"
    Contact.all_names
    puts "Type contact's name or press 'x' to exit"
    user_choice = gets.chomp
    Contact.all.each_with_index do |item, index|
      if user_choice == item.name
        puts "Enter email address"
        user_email = gets.chomp
        item.add_email(user_email)
      end
    end
  end

  def add_address
    puts "Which name would you like to add an address for?"
    Contact.all_names
    puts "Type contact's name or press 'x' to exit"
    user_choice = gets.chomp
    Contact.all.each_with_index do |item, index|
      if user_choice == item.name
        puts "Enter address"
        user_address = gets.chomp
        item.add_address(user_address)
      end
    end
  end

 def show_contacts
  puts "Here is a list of your contacts:"
  Contact.all_names
  puts "Type a contact's name if you want to see their info, otherwise press 'x' to exit"
  user_choice = gets.chomp
  Contact.all.each_with_index do |item, index|
    if user_choice == item.name
      item.phones
      item.emails
      item.addresses
    elsif user_choice == 'x'
      main_menu
    end
  end
  main_menu
end

def change_contact
  Contact.all_names
  puts "Type in the name of the contact you would like to change"
  user_choice = gets.chomp
  Contact.all.each_with_index do |item, index|
    if user_choice == item.name
      puts "Which would you like to edit? type 'p' for phone, 'e' for email, 'a' for address."
      user_edit = gets.chomp
        if user_edit == 'p'
          item.phones
          puts "Enter the number of the phone number you would like to change"
          choice = gets.chomp
          puts "Enter the new phone number"
          new_number = gets.chomp
          item.edit_phone(choice, new_number)
        elsif user_edit == 'e'
          item.emails
          puts "Enter the number of the email address you would like to change"
          choice = gets.chomp
          puts "Enter the new email address"
          new_email = gets.chomp
          item.edit_email(choice, new_email)
        elsif user_edit == 'a'
          item.addresses
          puts "Enter the number of the address you would like to change"
          choice = gets.chomp
          puts "Enter the new address"
          new_address = gets.chomp
          item.edit_address(choice, new_address)
        end
    end
  end
  main_menu
end

main_menu
