require 'hanami/interactor'

module BookInteractor
  class Create
    include Hanami::Interactor

    attr_reader :params
    attr_reader :repository
    expose :book
    
    def initialize(params, repository = BookRepository.new)
      @params = params
      @repository = repository
    end
    
    def call
      @book = repository.create(Book.new(params))
    end

    private

    def valid?
      validate_result = Validations::Create.new(params).validate
      
      if validate_result.failure?
        error(validate_result.messages)
      end

      validate_result.success?
    end
  end
end