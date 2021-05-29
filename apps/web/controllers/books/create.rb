module Web::Controllers::Books
  class Create
    include Web::Action

    def call(params)
      BookInteractor::Create.new.call(params[:book])

      redirect_to '/books'
    end
  end
end
