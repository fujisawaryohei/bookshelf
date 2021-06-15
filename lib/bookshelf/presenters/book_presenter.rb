require 'hanami/view'

class BookPresenter
  include Hanami::Presenter

  attr_reader :book    
  
  def initialize(book)
    @book = book  
  end

  def title
    book.title
  end

  def author
    book.author
  end

  def total_price
    "税込価格: #{book.total_price.round}円"
  end
end