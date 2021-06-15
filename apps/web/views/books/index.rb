module Web::Views::Books
  class Index
    include Web::View

    def books
      locals[:books].map{|book| BookPresenter.new(book) }
    end
  end
end
