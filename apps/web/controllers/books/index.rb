module Web::Controllers::Books
  class Index
    include Web::Action

    attr_reader :interactor

    expose :books

    def initialize(interactor = BookInteractor::Index.new)
      @interactor = interactor
    end

    def call(params)
      # Controllerの責務は入力（ここでいうparams）を受け取りアプリケーションにとって適切な形に変換して渡す事
      # 場合によっては変換処理をControllerで行い、InputDataをDTOとして渡して
      # オブジェクト化してUseCase Interactorに渡す。

      # アプリケーション固有のビジネスロジックはUseCaseInteractorに委譲
      @books = interactor.call(params)
    end
  end
end
