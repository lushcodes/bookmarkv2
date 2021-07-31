# frozen_string_literal: true

feature 'Updating bookmarks' do
  before { Bookmark.create(url: 'http://www.example.com', title: 'Example Title') }
  before { Bookmark.create(url: 'http://www.example.org', title: 'Example Title 2') }

  scenario 'can update a bookmark and show the updated bookmark on the page' do
    bookmarks = Bookmark.all
    first_bookmark = bookmarks[0]
    second_bookmark = bookmarks[1]
    visit('/bookmarks')

    expect(page).to have_link(first_bookmark.title, href: first_bookmark.url)
    expect(page).to have_link(second_bookmark.title, href: second_bookmark.url)

    first('.bookmark').click_button 'Edit'

    expect(page.current_path).to eq("/bookmarks/#{first_bookmark.id}/edit")

    fill_in(:bookmark_url, with: 'http://www.test.com')
    fill_in(:bookmark_title, with: 'Updated Bookmark Test')
    click_button 'Update'

    expect(page).not_to have_link(first_bookmark.title, href: first_bookmark.url)
    expect(page).to have_link('Updated Bookmark Test', href: 'http://www.test.com')
    expect(page).to have_link(second_bookmark.title, href: second_bookmark.url)
    expect(page.current_path).to eq('/bookmarks')
  end
end
