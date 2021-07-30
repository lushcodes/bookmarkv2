require 'spec_helper'

feature 'viewing bookmarks' do
  before { Bookmark.create(url: 'http://www.test.com') }
  scenario 'bookmarks are on the page' do
    visit('/bookmarks')
    expect(page).to have_content('http://www.test.com')
  end
end
