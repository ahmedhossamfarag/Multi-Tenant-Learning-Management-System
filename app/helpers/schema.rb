# frozen_string_literal: true

class Schema

  def self.create(name)
    validate name
    ActiveRecord::Base.connection.exec_query("CREATE SCHEMA IF NOT EXISTS #{name}")
  end

  def self.delete(name)
    validate name
    ActiveRecord::Base.connection.execute("DROP SCHEMA IF EXISTS #{name}")
  end

  def self.open(name)
    validate name
    ActiveRecord::Base.connection.execute("SET search_path TO #{name}")
  end

  def self.public
    open "public"
  end

  def self.list
    ActiveRecord::Base.connection.select_all("SELECT schema_name FROM information_schema.schemata").map { |r| r["schema_name"] }
  end

  def self.exists?(name)
    validate name
    list.include? name
  end

  private
  def self.validate(name)
    raise ArgumentError, "Invalid name: #{name}" unless name.downcase.match /\A[a-z]{3}[a-z0-9]*\Z/
  end

end
