module Web::Views::Books
  class Create
    include Web::View
    template 'books/new'

    def error_messages
      error_messages = []
      errors.each do |key, value|
        msg = "#{key} #{value[0]}"
        error_messages.push(msg)
      end
      error_messages
    end
  end
end
