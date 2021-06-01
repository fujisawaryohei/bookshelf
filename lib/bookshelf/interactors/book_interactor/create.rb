require 'hanami/interactor'

module BookInteractor
  class Create
    include Hanami::Interactor

    attr_reader :params
    attr_reader :repository
    expose :book, :error_messages
    
    def initialize(repository = BookRepository.new)
      @repository = repository
    end
    
    def call(params)
      @book = repository.create(Book.new(params))
    end

    private

    # 参考: https://www.rubydoc.info/gems/hanami-utils/Hanami/Interactor/LegacyInterface
    # valid?はHanami::Interactorをincludeするとcall呼び出し前に実行するフックメソッド
    # valid? を実行する
    # valid? の戻り値が真値であれば、クラスに定義された #call を実行する
    # valid? の戻り地が偽値であれば、何もしない
    # Hanami::Interactor::Result のインスタンスにexpose メソッドで指定したインスタンス変数を Dependency Injection する
    # callでHanami::Interactor::Result のインスタンスを返す
    def valid?(params)
      validate_result = Validations::Create.new(params).validate
      if validate_result.failure?
        @error_messages = validate_result.messages
      end

      validate_result.success?
    end
  end
end