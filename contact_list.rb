require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

def main_menu
  puts "Waiting for input"
  input = gets.chomp
  if input == ""  #removed "help"
    prompt
    response = gets.chomp
    if response == "new"
      new_contact
    elsif response == "list"
      list
    elsif response == "show"
      show
    else
      puts"nothing happened"
    end
  end
end

def show
  puts "Enter ID"
  id = gets.chomp.to_i
  puts ContactDatabase.show(id)
end

def list
  # ContactDatabase.load
end

def new_contact
  contact = get_info
  Contact.create(contact[0],contact[1])
end

def get_info
  contact = []
  puts "enter name"
  name = gets.chomp
  contact << name
  puts "enter email"
  email = gets.chomp
  contact << email
end

def prompt
puts "Here is a list of available commands:"
puts "  new - Create a new contact"
puts "  list - List all contacts"
puts "  show - Show a contact"
puts "  find - Find a contact" 
end

main_menu