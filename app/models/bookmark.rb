require 'pg'
class Bookmark
  def self.all
    connection = PG.connect dbname: "bookmark_manager_#{ENV['RACK_ENV']}"
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map do |row|
      new(id: row['id'], url: row['url'])
    end
  end

  def self.create(url:)
    connection = PG.connect dbname: "bookmark_manager_#{ENV['RACK_ENV']}"
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
  end

  attr_reader :id, :url

  def initialize(id:, url:)
    @id = id
    @url = url
  end
end
