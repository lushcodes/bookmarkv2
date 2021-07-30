# frozen_string_literal: true

feature 'Test' do
  scenario 'Confirms capybara/rspec works correctly' do
    visit('/')
    expect(page).to have_content 'CAPYBARA / RSPEC WORKING!'
  end
end

# THIS TEST CONFIRMS THAT CAPYBARA / RSPEC IS WORKING CORRECTLY AND THE RIGHT GEMS ARE INSTALLED. FEEL FREE TO DELETE THIS TEST FILE ENTIRELY
