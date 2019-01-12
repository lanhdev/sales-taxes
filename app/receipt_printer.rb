class ReceiptPrinter
  def execute
    receipt = CSVImporter.new(input_file).import
    CSVExporter.new(receipt).export
  end

  private

  def input_file
    Dir.pwd + '/input/input1.csv'
  end
end
