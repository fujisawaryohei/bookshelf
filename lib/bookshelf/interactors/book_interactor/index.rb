require 'hanami/interactor'

module BookInteractor
  class BookList
    attr_reader :repository
    # RubyでDIPの効果（下位レイヤーの実装に依存しない）を得るためには
    # Duck TypingとDIを用いる
    def initialize(repository = BookRepository.new)
      @repository = repository
    end

    def call(input)
      # UseCaseの責務はあくまでアプリケーション固有のビジネルルールを定義, 実装すること
      # 永続化処理はRepositoryに委譲
      repository.all
    end
  end
end