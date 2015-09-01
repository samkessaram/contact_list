## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase
  def self.load
    file = File.open("contacts.csv", "r")
    database = file.read
  end

  def self.add(contact)
    file = File.open("contacts.csv", "a")
    file.puts contact
    file.close
  end
end