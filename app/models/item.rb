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

  def total_price
    rounded(original_price + sales_taxes)
  end

  private

  attr_reader :quantity, :product, :price

  def original_price
    quantity * price
  end

  def sales_taxes
    original_price * total_taxes
  end

  def rounded(number)
    (number * 20).ceil / 20.0
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
