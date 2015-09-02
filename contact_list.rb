require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

def main_menu
  # puts "Waiting for input"
  # input = gets.chomp
  if ARGV.first == "help"  #removed "help"
  prompt
  elsif ARGV.first == "new"
    new_contact
  elsif ARGV.first == "list"
    Contact.all
  elsif ARGV.first == "show"
    id = ARGV[1]
    Contact.show(id)
  elsif ARGV.first == "find"
    x = ARGV[1]
    Contact.find(x)
  else
    puts "no command"
  end
end

def new_contact
  contact = get_info
  file = File.open("contacts.csv", "r")
  file.readlines.each do |line|
    if line.downcase.include? contact[1]
      puts "Sorry, someone with that email already exists."
      return
    end
  end
  Contact.create(contact[0],contact[1])
end

def get_info
  contact = []
  puts "enter name"
  name = STDIN.gets.chomp
  contact << name
  puts "enter email"
  email = STDIN.gets.chomp
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