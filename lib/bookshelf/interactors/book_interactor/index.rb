require 'hanami/interactor'

module BookInteractor
  class Index
    def initialize(repository)
      @repository = repository
    end

    def call
      @repository.all
    end
  end
end