# /lib/bookshelf/entities/book.rb
# Table name: books
#
#  id          :bigint           not null, primary key
#  author      :string           not null
#  title       :string           not null
#  unit_price  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
class Book < Hanami::Entity
  def total_price
    self.unit_price * 1.08
  end
end
