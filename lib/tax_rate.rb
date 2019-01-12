class TaxRate
  BASIC = 0.1
  IMPORTED = 0.05
  FREE_TAX_PRODUCTS = %w(book chocolate pills)

  def initialize(product)
    @product = product
  end

  def tax_rate
    tax = 0
    tax += BASIC unless exempt?
    tax += IMPORTED if imported?
    tax
  end

  private

  attr_reader :product

  def exempt?
    FREE_TAX_PRODUCTS.any? { |key_word| product.include?(key_word) }
  end

  def imported?
    product.include?('imported')
  end
end
