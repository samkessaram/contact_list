require_relative '../setup'
require_relative 'contact'
require_relative 'phone_number'

puts 'Seeding Tables ...'

@contact1 = Contact.create(firstname: "Sam", lastname: "Kessaram", email: "samkessaram@gmail.com")

@contact2 = Contact.create(firstname: "Luke", lastname: "Kessaram", email: "lukessaram@gmail.com")

@contact3 = Contact.create(firstname: "Sacha", lastname: "Kessaram", email: "sachakessaram@gmail.com")

@contact4 = Contact.create(firstname: "Dominique", lastname: "Fascinato", email: "dominique.fascinato@gmail.com")

@contact5 = Contact.create(firstname: "Christian", lastname: "Breukelman", email: "cdbreukelman@gmail.com")

@contact6 = Contact.create(firstname: "Peter", lastname: "Massie", email: "p.massie@uottawa.ca")

# def save
#   if persisted?
#     Contact.update
#   else
#     Contact.create(firstname: firstname, lastname: lastname, email: email)
#   end
# end

def find(id)
  contact = Contact.find(id)
  puts "#{contact.firstname} #{contact.lastname}, #{contact.email}"
end

def find_all_by_firstname(name)
  contacts = Contact.where(firstname:name)
  contacts.each do |contact|
    puts "#{contact.firstname} #{contact.lastname}, #{contact.email}"
  end
end

def find_all_by_lastname(name)
  contacts = Contact.where(lastname:name)
  contacts.each do |contact|
    puts "#{contact.firstname} #{contact.lastname}, #{contact.email}"
  end
end

def find_by_email(address)
  contact = Contact.where(email:address)[0]
  puts "#{contact.firstname} #{contact.lastname}, #{contact.email}"
end

find_by_email("samkessaram@gmail.com")

@contact1.phone_numbers.create(phone_number:'416-735-3319')



