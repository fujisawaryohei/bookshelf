RSpec.describe Web::Controllers::Books::Create, type: :action do
  # フェイクオブジェクトを生成
  let(:book) { Book.new(title: 'Confident Ruby', author: 'Avdi Grimm', unit_price: 3500) }
  # Repositoryのモックオブジェクトを生成
  let(:repository) { double('BookRepository', create: book) }
  # RepositoryのモックオブジェクトをInteractorにスタブする
  let(:interactor) { BookInteractor::AddBook.new(repository) }
  # スタブしたInteractorをControllerにDI
  let(:action) { described_class.new(interactor) }

  # let(:action) { described_class.new }
  # let(:repository) { BookRepository.new }

  # before do
  #   repository.clear
  # end

  context 'with valid params' do
    let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm', unit_price: 3500 }] }

    it 'create a book' do
      # DBをバイパスせずに行う場合のテストコード
      # action.call(params)
      # book = repository.last
  
      # expect(book.id).to_not be_nil
      # expect(book.title).to eq(params.dig(:book, :title))

      # DBをバイパスする場合のテストコード
      response = action.call(params)
      expect(action.book.title).to eq params[:book][:title]
      expect(action.book.author).to eq params[:book][:author]
      expect(action.book.unit_price).to eq params[:book][:unit_price]
      expect(action.exposures[:book]).to eq Book.new(params[:book])
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
      expect(action.errors).not_to be_nil
    end
  end
end
