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
      new_contact = Contact.new(name, email)
      contact = "#{name}, #{email}"
      ContactDatabase.add(contact)
    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      contact_list.each do |entry|
        if entry.include?(term.downcase)
          return entry
        end
      end
    end
 
    def all
      # TODO: Return the list of contacts, as is
      return contact_list
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      contact_list.each do |entry|
        if entry.include?(term.downcase)
          return entry
        end
      end
    end
    
  end
 
end