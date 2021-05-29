require 'hanami/validations'

# 合成して使用することができるためClassで定義
# 参照: https://github.com/hanami/validations#composition
module BookInteractor::Validations
  class Create
    include Hanami::Validations

    validations do
      # 文字列が入力されている事を検証　
      required(:title).filled(:str?)
      required(:author).filled(:str?)
    end
  end
end