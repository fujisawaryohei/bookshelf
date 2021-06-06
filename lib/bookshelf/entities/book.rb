class Book < Hanami::Entity
  def total_price
    self.unit_price * 1.08
  end
end
