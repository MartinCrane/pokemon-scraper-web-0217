require 'pry'

class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name,type)
  end

  def self.find(id, db)
      record = db.execute("SELECT id, name, type FROM pokemon WHERE id = '#{id}'").flatten
      puts record
      binding.pry
      new_record = self.new(id: id, name: record[1], type: record[2],db: db)
  end
end
