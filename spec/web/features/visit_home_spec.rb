require 'features_helper'

RSpec.describe 'visit home' do
  it 'is successfule' do
    visit '/'

    expect(page).to have_content('BookShelf')
  end
end