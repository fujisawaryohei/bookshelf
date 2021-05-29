require 'hanami/validations'

module BookInteractor::Validations
  class Create
    include Hanami::Validations

    validations do
      required(:title) { filled? }
      required(:author) { filled? }
    end
  end
end