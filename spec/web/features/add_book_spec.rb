require 'features_helper'

RSpec.describe 'Add a book' do
  after do
    BookRepository.new.clear
  end

  it 'can create a new book' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'Title', with: 'Example book'
      fill_in 'Author', with: 'Some author'
      fill_in 'Unit price', with: 2000

      click_button 'Create'
    end

    expect(page).to have_current_path('/books')
    expect(page).to have_content('Example book')
  end

  it 'displays list of errors when params contains errors' do
    visit '/books/new'

    within 'form#book-form' do
      click_button 'Create'
    end

    expect(current_path).to eq('/books')

    expect(page).to have_content('There was a problem with your submission')
    expect(page).to have_content('title must be filled')
    expect(page).to have_content('author must be filled')
    expect(page).to have_content('unit_price must be filled')
  end
end