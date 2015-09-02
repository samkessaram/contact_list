class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end
 
  def to_s
    # self.to_s
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      contact = Contact.new(name, email)
      index = ContactDatabase.last + 1
      new_entry = "#{name} (#{email})"
      puts "ID: #{index}"
      ContactDatabase.add(new_entry)
    end
 
    def find(x)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      file = File.open("contacts.csv", "r")
      file.readlines.each_with_index do |line, index|
        if line.downcase.include? x
      puts "#{index+1} #{line}"
    end
  end
    end
 
    def all
      ContactDatabase.load
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      id = id.to_i
      entry = nil
      i = nil
      file = File.open("contacts.csv", "r")
      file.readlines.each_with_index do |line, index|
        if index == (id - 1)
          entry = line 
          i = index + 1
        end
      end
      if entry == nil
        puts "Contact not found, please check ID and try again."
      else
      name = entry.split(" ")
      puts "\nID: #{i}"
      email = entry.split(" ")[2].split(/[()]/)[1]
      puts "Name: #{name[0]} #{name[1]}"
      puts "email: #{email}"
      end
    end 
  end
end