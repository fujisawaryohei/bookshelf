module Web::Views::Books
  class Index
    include Web::View

    def total_price(book)
      "税込価格: #{book.total_price.round}円"
    end
  end
end
