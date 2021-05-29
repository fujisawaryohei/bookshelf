RSpec.describe Web::Controllers::Books::Create, type: :action do
  let(:action) { described_class.new }
  let(:repository) { BookRepository.new }

  before do
    repository.clear
  end

  context 'with valid params' do
    let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }

    it 'create a book' do
      action.call(params)
      book = repository.last
  
      expect(book.id).to_not be_nil
      expect(book.title).to eq(params.dig(:book, :title))
    end
  
    it 'redirect the user to the books listing' do
      response = action.call(params)
  
      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq('/books')
    end
  end

  context 'with invalid params' do
    let(:params){ Hash[book:{ hoge: 'fuga' }] }

    it 'returns HTTP Client error' do
      response = action.call(params)

      # mass assignment 対策が有効かどうか
      expect(response[0]).to eq(422)
    end
  end
end
