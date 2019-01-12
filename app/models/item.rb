class Item
  module TaxRate
    BASIC = 0.1
    IMPORTED = 0.05
  end

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
    original_price * total_taxes
  end

  private

  attr_reader :quantity, :product, :price

  def original_price
    quantity * price
  end

  def total_taxes
    taxes = 0
    taxes += TaxRate::BASIC unless exempt?
    taxes += TaxRate::IMPORTED if imported?
  end

  def exempt?
    false
  end

  def imported?
    true
  end
end
