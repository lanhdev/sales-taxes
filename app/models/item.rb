class Item
  def initialize(quantity, product, price)
    @quantity = quantity
    @product = product
    @price = price
  end

  def decorate
    [quantity, " #{product}", " #{"%.2f" % price_with_taxes}"]
  end

  def price_with_taxes
    total_price + taxes
  end

  def taxes
    FormatNumber.new(total_price * TaxRate.new(product).tax_rate).format_round
  end

  attr_reader :quantity, :product, :price

  private

  def total_price
    quantity * price
  end
end
