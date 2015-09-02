## TODO: Implement CSV reading/writing
require 'csv'
require 'pry'

class ContactDatabase
  def self.load
    file = File.open("contacts.csv", "r")
    contents = file.readlines.each_with_index do |line, index|
      puts "#{index+1}: #{line}"
    end
  end

  def self.add(contact)
    file = File.open("contacts.csv", "a")
    file.puts contact
    file.close
  end

  def self.last
    file = File.open("contacts.csv", "r")
    last_index = file.readlines.length
    last_index
  end
end