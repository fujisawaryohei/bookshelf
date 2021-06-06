RSpec.describe Web::Controllers::Books::Index, type: :action do
  let(:params) { Hash[] }
  # フェイクオブジェクトの生成
  let(:books) { 
    [ 
      Book.new(title: 'TDD', author: 'Kent Beck', unit_price: 3500, total_price: 3500 * 1.08 ),
      Book.new(title: 'Confident Ruby', author: 'Avdi Grimm', unit_price: 3500, total_price: 3500 * 1.08 )
    ]
  }
  # Repositoryのモックオブジェクトを生成
  let(:repository) { double('repository', all: books) }
  # RepositoryのモックオブジェクトをInteractにスタブする
  let(:interactor) {BookInteractor::BookList.new(repository)}
  # スタブしたInteractorをControllerにDI
  let(:action) { described_class.new(interactor) }

  # before do
  #   repository.clear

  #   @book = repository.create(title: 'TDD', author: 'Kent Beck')
  # end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all books' do
    action.call(params)
    expect(action.exposures[:books]).to eq(books)
  end
end
