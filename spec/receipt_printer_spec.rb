require_relative '../app/receipt_printer'
require_relative '../lib/csv_importer'
require_relative '../lib/csv_exporter'

describe ReceiptPrinter do
  let(:subject) { ReceiptPrinter.new.execute }

  describe 'execute' do
    it 'export the receipt' do
      expect_any_instance_of(CSVImporter).to receive(:import)
      expect_any_instance_of(CSVExporter).to receive(:export)
      subject
    end
  end
end
