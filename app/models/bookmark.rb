# frozen_string_literal: true

require 'pg'

class Bookmark
  # returns an array of bookmarks
  def self.all
    # connects to database (the command will work out if using the test or development
    # database by referencing both the spec helper/controller)
    connection = PG.connect dbname: "bookmark_manager_#{ENV['RACK_ENV']}"
    # saves the SQL query as a result
    # e.g <PG::Result:0x00007f98ed52f8b8 status=PGRES_TUPLES_OK ntuples=0 nfields=2 cmd_tuples=0>
    result = connection.exec('SELECT * FROM bookmarks;')
    # Creates a new bookmark object for each table row and uses the data from each row
    # to populate the attributes of that particular bookmark
    result.map do |row|
      new(id: row['id'], url: row['url'], title: row['title'])
    end
  end

  # creates a persisted bookmark object and adds it to the database
  def self.create(url:, title:)
    # connects to database (the command will work out if using the test or development
    # database by referencing the spec helper/controller)
    connection = PG.connect dbname: "bookmark_manager_#{ENV['RACK_ENV']}"
    # Executes SQL query inserting a new bookmark into the table
    # using the method's arguments as the values for the columns
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
  end

  # deletes a bookmark object and removes it from the database
  def self.delete(id:)
    connection = PG.connect dbname: "bookmark_manager_#{ENV['RACK_ENV']}"
    # saves the SQL query as a result
    # e.g <PG::Result:0x00007f98ed52f8b8 status=PGRES_TUPLES_OK ntuples=0 nfields=2 cmd_tuples=0>
    connection.exec("DELETE FROM bookmarks WHERE id=#{id}")
    # Executes SQL query deleting bookmark from the table
    # using the bookmark's id argument as a locator
  end
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end
end
