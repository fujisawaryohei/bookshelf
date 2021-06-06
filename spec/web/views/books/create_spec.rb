RSpec.describe Web::Views::Books::Create, type: :view do
  let(:errors) { { title: ['must be filled'], author: ['must be filled'], unit_price: ['must be filled'] } }
  let(:exposures) { Hash[errors: errors] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/new.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:error_messages)  { view.error_messages }

  it 'displays list of errors when params contains errors' do
    expect(error_messages[0]).to include('title must be filled')
    expect(error_messages[1]).to include('author must be filled')
    expect(error_messages[2]).to include('unit_price must be filled')
  end
end
