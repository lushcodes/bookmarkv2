require './app/models/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns an array of bookmarks' do
      connection = PG.connect dbname: "bookmark_manager_#{ENV['RACK_ENV']}"
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.test.com')")

      bookmarks = Bookmark.all

      expect(bookmarks.first.url).to eq('http://www.test.com')
    end
  end

  describe '.create' do
    it 'returns a bookmark instance that is persisted' do
      Bookmark.create(url: 'http://www.test.com')
      bookmarks = Bookmark.all
      expect(bookmarks.first.url).to eq('http://www.test.com')
    end
  end
end
