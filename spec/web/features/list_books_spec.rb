require 'features_helper'

RSpec.describe 'List books' do
  it 'dispaly each book on page' do
    visit '/books'

    within '#books' do
      expect(page).to have_css('.book', count: 2)
    end
  end
end