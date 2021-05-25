module Web::Controllers::Books
  class Index
    include Web::Action

    expose :books

    def call(params)
      @books = BookInteractor::Index.new(BookRepository.new).call
    end
  end
end
