module Web::Controllers::Books
  class Create
    include Web::Action

    # Presenterの役割であるViewsに渡している
    expose :book, :errors

    def call(params)
      interactor = BookInteractor::Create.new(params[:book]).call
      if interactor.success?
        @book = interactor.book
        redirect_to '/books'
      else
        @errors = interactor.error_messages
        self.status = 422
      end
    end
  end
end
