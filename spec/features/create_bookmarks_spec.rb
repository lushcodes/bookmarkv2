feature 'Creating bookmarks' do
  scenario 'can add a bookmark and see it on the page' do
    visit('/bookmarks')
    fill_in 'bookmark_url', with: 'http://www.test.com'
    click_button 'Save'
    expect(page).to have_content('http://www.test.com')
    expect(page.current_path).to eq('/bookmarks')
  end
end
