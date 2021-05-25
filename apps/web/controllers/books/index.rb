module Web::Controllers::Books
  class Index
    include Web::Action

    expose :books

    def call(params)
      # Controllerの責務は入力（ここでいうparams）を受け取りアプリケーションにとって適切な形に変換して渡す事
      # 場合によっては変換処理をControllerで行い、InputDataをDTOとして渡して
      # オブジェクト化してUseCase Interactorに渡す。

      # アプリケーション固有のビジネルロジックはUseCaseInteractorに委譲
      @books = BookInteractor::Index.new.call(params)
    end
  end
end
