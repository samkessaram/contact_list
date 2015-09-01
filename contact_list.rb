require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

def main_menu
  puts "Waiting for input"
  input = gets.chomp
  if input == "help"
    puts "Here is a list of available commands:"
      puts "new - Create a new contact"
      puts "list - List all contacts"
      puts "show - Show a contact"
      puts "find - Find a contact" 
      input2 = gets.chomp
      if input2 == "new"
        new_contact
      end 
  end
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


main_menu