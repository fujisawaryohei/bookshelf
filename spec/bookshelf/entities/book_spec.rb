RSpec.describe Book, type: :entity do
  it 'can be initialized with attrubutes' do
    book = Book.new(title: 'Refactoring')
    expect(book.title). to eq('Refactoring')
  end
  
  it 'add tax to unitPrice' do
    book = Book.new(title: 'Confident Ruby', author: 'Avdi Grimm', unit_price: 2500)
    expect(book.total_price).to eq 2500 * 1.08
  end
end
