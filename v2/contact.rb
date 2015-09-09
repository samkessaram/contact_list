require 'pg'
require 'pry'

class Contact
  
  attr_accessor :firstname, :lastname, :email, :id

  def initialize(firstname, lastname, email, id=nil) #need id here?
    @firstname = firstname
    @lastname = lastname
    @email = email
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
    if persisted?
      sql = "UPDATE contacts SET firstname = $1, lastname = $2, email = $3 WHERE id = #{id} RETURNING id;"
    else
      sql = "INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3) RETURNING id;"
    end
    res = self.class.conn.exec_params(sql, [@firstname, @lastname, @email])
    @id = res[0]["id"]
    true
  # rescue  PG::Error
  #   false
  end

  def persisted?
    !@id.nil?
  end

  def destroy
    sql = "DELETE FROM contacts WHERE id = $1;"
    self.class.conn.exec_params(sql, [@id])
  end

  def self.find(id)
    sql = "SELECT * FROM contacts WHERE id = $1;"
    conn.exec_params(sql, [id]) do |response|
      result = response.values[0]
      # remember that the ID is the first result in the result array
      Contact.new(result[1], result[2], result[3], result[0])
    end
  end

  def self.execute(column,sql,arr)
    conn.exec_params(sql, [column]) do |response|
      response.values.each do |field|
      # remember that the ID is the first result in the result array
      arr << Contact.new(field[1], field[2], field[3], field[0])
      end
    end
  end

  def self.find_all_by_firstname(name)
    contacts = []

    sql = "SELECT * FROM contacts WHERE firstname = $1;"
    execute(name,sql,contacts)
  end

  def self.find_all_by_lastname(name)
    contacts = []

    sql = "SELECT * FROM contacts WHERE lastname = $1;"
    execute(name,sql,contacts)
  end

  def self.find_by_email(email)
    contacts = []

    sql = "SELECT * FROM contacts WHERE email = $1;"
    execute(email,sql,contacts)
  end

  def add_number(number)
    phone_number = PhoneNumber.new(number, @id)
    sql = "UPDATE phone_nums SET number = $1, contact_id = $2 WHERE id = #{id};"
    result = self.class.conn.exec_params(sql, [number, @id])
    true
  end

end










