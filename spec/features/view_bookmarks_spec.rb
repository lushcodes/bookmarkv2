# frozen_string_literal: true

require 'spec_helper'

feature 'viewing bookmarks' do
  before { Bookmark.create(url: 'http://www.example.com', title: 'Example Title') }

  scenario 'bookmarks are on the page' do
    visit('/bookmarks')
    expect(page).to have_link('Example Title', href: 'http://www.example.com')
  end
end
