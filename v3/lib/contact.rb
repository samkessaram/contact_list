require_relative 'phone_number'

class Contact < ActiveRecord::Base

  has_many :phone_numbers

end







