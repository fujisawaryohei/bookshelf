module Web::Controllers::Books
  class Create
    include Web::Action

    attr_reader :interactor

    expose :errors

    def initialize(interactor = BookInteractor::Create.new)
      @interactor = interactor
    end

    def call(params)
      interactor_result = interactor.call(params[:book])
      if interactor_result.success?
        @book = interactor_result.book
        redirect_to '/books'
      else
        @errors = interactor_result.error_messages
        self.status = 422
      end
    end
  end
end
