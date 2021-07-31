feature 'Deleting bookmarks' do
  before { Bookmark.create(url: 'http://www.example.com', title: 'Example Title') }
  before { Bookmark.create(url: 'http://www.example.org', title: 'Example Title 2') }

  scenario 'can delete a bookmark and remove it from the page' do
    bookmarks = Bookmark.all
    first_bookmark, second_bookmark = bookmarks[0], bookmarks[1]
    visit('/bookmarks')

    expect(page).to have_link(first_bookmark.title, href: first_bookmark.url)
    expect(page).to have_link(second_bookmark.title, href: second_bookmark.url)

    first('.bookmark').click_button 'Delete'

    expect(page).not_to have_link(first_bookmark.title, href: first_bookmark.url)
    expect(page).to have_link(second_bookmark.title, href: second_bookmark.url)
    expect(page.current_path).to eq('/bookmarks')
  end
end
