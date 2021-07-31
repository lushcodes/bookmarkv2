# frozen_string_literal: true

require './app/models/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns an array of bookmarks' do
      connection = PG.connect dbname: "bookmark_manager_#{ENV['RACK_ENV']}"
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.example.com', 'Example Title');")

      bookmarks = Bookmark.all

      expect(bookmarks.first.url).to eq('http://www.example.com')
    end
  end

  describe '.create' do
    it 'returns a bookmark instance that is persisted' do
      Bookmark.create(url: 'http://www.example.com', title: 'Example Title')
      bookmarks = Bookmark.all
      expect(bookmarks.first.url).to eq('http://www.example.com')
      expect(bookmarks.first.title).to eq('Example Title')
    end
  end

  describe '.delete' do
    it 'removes a record from the table' do
      Bookmark.create(url: 'http://www.example.com', title: 'Example Title')
      bookmarks = Bookmark.all
      first_bookmark = bookmarks[0]
      Bookmark.delete(id: first_bookmark.id)
      expect(Bookmark.all.empty?).to eq(true)
    end
  end
end
