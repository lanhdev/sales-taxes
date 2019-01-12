class Item
  def initialize(quantity, product, price)
    @quantity = quantity
    @product = product
    @price = price
  end

  def decorate
    "#{quantity}, #{product}, #{"%.2f" % total_price}"
  end

  def total_price
    FormatNumber.new(original_price + sales_taxes).format_round
  end

  def sales_taxes
    original_price * TaxRate.new(product).tax_rate
  end

  private

  attr_reader :quantity, :product, :price

  def original_price
    quantity * price
  end
end
