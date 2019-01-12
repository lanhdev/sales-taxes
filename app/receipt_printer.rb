class ReceiptPrinter
  def initialize(input_file)
    @input_file = input_file
  end

  def execute
    receipt = CSVImporter.new(input_file).import
    CSVExporter.new(receipt).export
  end

  private

  attr_reader :input_file
end
