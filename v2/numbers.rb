require_relative 'contact'

class PhoneNumber

  def initialize(number, contact_id, id=nil)
    @number = number
    @contact_id = contact_id
    @id = id
  end

  def self.conn
    PG.connect(
      host: 'localhost',
      dbname: 'contact_list',
      user: 'development',
      password: 'development'
      )
  end

  def save

  end

end