require 'features_helper'

RSpec.describe 'List books' do
  let(:repository) { BookRepository.new }

  before do
    repository.clear
    
    repository.create(title: 'PoEAA', author: 'Martin Fowler', unit_price: 4000)
    repository.create(title: 'TDD', author: 'Kent Beck', unit_price: 3000)
  end

  it 'dispaly each book on page' do
    visit '/books'

    within '#books' do
      expect(page).to have_selector('.book', count: 2), 'Expected to find 2 books'
    end
  end
end