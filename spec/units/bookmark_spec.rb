# frozen_string_literal: true

require './app/models/bookmark'
require './lib/db_connection'

describe Bookmark do
  describe '.find' do
    it 'returns a bookmark instance by id' do
      Bookmark.create(url: 'http://www.example.com', title: 'Example Title')
      bookmarks = Bookmark.all
      bookmark = bookmarks.first
      found_bookmark = Bookmark.find(id: bookmark.id)
      expect(found_bookmark.id).to eq(bookmark.id)
      expect(found_bookmark.url).to eq(bookmark.url)
      expect(found_bookmark.title).to eq(bookmark.title)
    end
  end

  describe '.all' do
    it 'returns an array of bookmarks' do
      DBConnection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.example.com', 'Example Title');")

      bookmarks = Bookmark.all

      expect(bookmarks.first.url).to eq('http://www.example.com')
      expect(bookmarks.first.title).to eq('Example Title')
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

  describe '.update' do
    it 'updates a record in the table' do
      DBConnection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.example.com', 'Example Title');")

      bookmarks = Bookmark.all
      first_bookmark = bookmarks[0]

      first_bookmark.update(url: 'http://www.changed-url.com', title: 'Changed URL')
      updated_bookmark = Bookmark.find(id: first_bookmark.id)

      expect(updated_bookmark.url).to eq('http://www.changed-url.com')
      expect(updated_bookmark.title).to eq('Changed URL')
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
