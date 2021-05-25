require 'hanami/interactor'

module BookInteractor
  class Index
    def initialize(repository = BookRepository.new)
      @repository = repository
    end

    def call(input)
      # UseCaseの責務はあくまでアプリケーション固有のビジネルルールを定義, 実装すること
      # 永続化処理はRepositoryに委譲
      @repository.all
    end
  end
end