module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book
    expose :error_message

    def call(params)
      interactor = BookInteractor::Create.new(params[:book]).call
      if interactor.success?
        @book = interactor.book
        redirect_to '/books'
      else
        @error_message = interactor.error
        self.status = 422
      end
    end
  end
end
