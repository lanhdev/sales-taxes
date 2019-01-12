class FormatNumber
  def initialize(number)
    @number = number
  end

  def format_round
    (number * 20).ceil / 20.0
  end

  def format_precision
    "%.2f" % number
  end

  private

  attr_reader :number
end
