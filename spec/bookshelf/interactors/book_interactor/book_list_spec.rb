RSpec.describe BookInteractor::BookList, type: :interactor do
  let(:books) { [Book.new(title: 'TDD', author: 'Kent Beck'), Book.new(title: 'Confident Ruby', author: 'Avdi Grimm')] }
  let(:repository) { double('BookRepository', all: books) }
  let(:interactor) { described_class.new(repository) }

  it 'return books' do
    interactor_result = interactor.call
    expect(interactor_result).to eq books
  end 
end