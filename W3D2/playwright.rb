require 'sqlite3'
require 'singleton'
require_relative 'plays'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright
  attr_accessor :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        playwrights
    SQL
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    name = PlayDBConnection.instance.execute(<<-SQL, @name)
    SELECT
      *
    FROM
      plays
    WHERE
      name = ?
    SQL
    return nil unless name.length > 0
    Playwright.new(name.first)
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already exists in DB" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_i
  end

  def update
    raise "#{self} not in DB" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @id, @name, @birth_year)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays

  end
end
