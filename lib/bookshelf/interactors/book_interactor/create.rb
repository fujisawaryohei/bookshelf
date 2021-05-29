require 'hanami/interactor'

module BookInteractor
  class Create
    attr_reader :repository
    
    def initialize(repository = BookRepository.new)
      @repository = repository
    end
    
    def call(book_params)
      book = Book.new(book_params)
      repository.create(book)
    end
  end
end