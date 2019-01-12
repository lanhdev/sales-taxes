class Receipt
  def initialize
    @items = []
  end

  def add_item(item)
    items.push(item)
  end

  def price_with_taxes
    items.reduce(0) { |sum, item| sum + item.total_price }
  end

  def total_taxes
    items.reduce(0) { |sum, item| sum + item.sales_taxes }
  end

  private

  attr_reader :items
end
