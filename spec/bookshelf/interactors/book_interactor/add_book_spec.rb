RSpec.describe BookInteractor::AddBook, type: :interactor do
  let(:book) { Book.new(params) }
  let(:repository) { double('BookRepository', create: book)}
  let(:interactor) { described_class.new(repository) }
  
  context 'with valid params' do
    let(:params) {Hash[ { title: 'TDD', author: 'Kent Beck', unit_price: 3500 } ]}
    it 'create a book' do
      interactor_result = interactor.call(params)
      expect(interactor_result.book.title).to eq params[:title]
      expect(interactor_result.book.author).to eq params[:author]
      expect(interactor_result.book.unit_price).to eq params[:unit_price]
    end

    # 永続化しているかどうかのテストはBookRepositoryが
    # createメソッドを呼んでいるかどうかをテストする
    context 'persistence' do
      # instance_double は 未定義のインスタンスメソッドをスタブした際にエラーを吐いてくれる
      let(:repository) { instance_double('BookRepository') }
      it 'persist a book' do
        expect(repository).to receive(:create)
        BookInteractor::AddBook.new(repository).call(params)
      end
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[title: '', author: '']}
    it 'create a book' do
      interactor_result = interactor.call(params)
      expect(interactor_result.error_messages).not_to be_nil
      expect(interactor_result.error_messages[:title]).to eq ["must be filled"]
      expect(interactor_result.error_messages[:author]).to eq ["must be filled"]
    end
  end
end