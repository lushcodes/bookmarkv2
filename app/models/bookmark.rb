# frozen_string_literal: true

require 'pg'
require './lib/db_connection'

class Bookmark
  include DBConnection

  def self.all
    result = DBConnection.exec('SELECT * FROM bookmarks;')
    result.map do |row|
      new(id: row['id'], url: row['url'], title: row['title'])
    end
  end

  def self.create(url:, title:)
    DBConnection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
  end

  def self.find(id:)
    result = DBConnection.exec("SELECT * FROM bookmarks WHERE id=#{id};")
    result.map do |row|
      Bookmark.new(id: row['id'], url: row['url'], title: row['title'])
    end.first
  end

  def self.delete(id:)
    DBConnection.exec("DELETE FROM bookmarks WHERE id=#{id}")
  end
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def update(url: , title:)
    DBConnection.exec("UPDATE bookmarks SET url ='#{url}', title = '#{title}' WHERE id =#{id}")
  end
end
