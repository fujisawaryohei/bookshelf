module Web::Controllers::Books
  class Index
    include Web::Action

    expose :books

    def call(params)
      # Controllerの責務は入力を受け取りアプリケーションにとって適切な形に変換して渡す事
      # アプリケーション固有のビジネルロジックはUseCaseInteractorに委譲
      @books = BookInteractor::Index.new.call(params)
    end
  end
end
