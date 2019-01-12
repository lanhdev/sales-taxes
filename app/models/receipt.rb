class Receipt
  def initialize
    @items = []
  end

  def add_item(item)
    items.push(item)
  end

  def total_price_with_taxes
    total = items.reduce(0) { |sum, item| sum + item.price_with_taxes }
    FormatNumber.new(total).format_precision
  end

  def total_taxes
    total = items.reduce(0) { |sum, item| sum + item.taxes }
    FormatNumber.new(total).format_precision
  end

  attr_reader :items
end
