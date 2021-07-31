# frozen_string_literal: true

feature 'Creating bookmarks' do
  scenario 'can add a bookmark and see it on the page' do
    visit('/bookmarks')
    fill_in 'bookmark_url', with: 'http://www.example.com'
    fill_in 'bookmark_title', with: 'Example Title'
    click_button 'Save'
    expect(page).to have_link('Example Title', href: 'http://www.example.com')
    expect(page.current_path).to eq('/bookmarks')
  end
end
