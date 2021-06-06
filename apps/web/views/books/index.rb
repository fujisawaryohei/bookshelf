module Web::Views::Books
  class Index
    include Web::View

    def total_price(book)
      book.total_price.round
    end
  end
end
