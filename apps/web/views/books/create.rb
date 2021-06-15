module Web::Views::Books
  class Create
    include Web::View
    template 'books/new'

    def error_messages
      error_messages = []
      errors.each do |error|
        error_messages = error.map{|k, v| error_format(k, v) }
      end
      error_messages
    end

    private

    def error_format(key, values)
      "#{key} #{values.join(",")}"
    end
  end
end
