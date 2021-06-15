module Web::Controllers::Books
  class Create
    include Web::Action

    attr_reader :interactor
    
    before { |params| cast_unit_price(params) }

    expose :book, :errors

    def initialize(interactor = BookInteractor::AddBook.new)
      @interactor = interactor
    end

    def call(params)
      interactor_result = interactor.call(params[:book])
      if interactor_result.success?
        @book = interactor_result.book
        redirect_to '/books'
      else
        @errors = interactor_result.errors
        self.status = 422
      end
    end

    private

    def cast_unit_price(params)
      return unless params[:book].key?(:unit_price)
      unit_price = params[:book][:unit_price]
      params[:book][:unit_price] = unit_price.to_i unless unit_price.empty?
    end
  end
end
