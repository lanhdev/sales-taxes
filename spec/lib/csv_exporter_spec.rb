require_relative '../../app/models/receipt'
require_relative '../../app/models/item'
require_relative '../../app/decorators/format_number'
require_relative '../../lib/tax_rate'
require_relative '../../lib/csv_exporter'

describe CSVExporter do
  let(:exporter) { CSVExporter.new(data_export) }
  let(:data_export) { Receipt.new }

  describe 'export' do
    let(:item1) { Item.new(1, 'book', 12.49) }
    let(:item2) { Item.new(1, 'music cd', 14.99) }
    let(:item3) { Item.new(1, 'chocolate bar', 0.85) }
    let(:subject) { exporter.export }
    let(:result) do
      [
        [1, " book", " 12.49"],
        [1, " music cd", " 16.49"],
        [1, " chocolate bar", " 0.85"],
        ["Sales Taxes: 1.50"],
        ["Total: 29.83"]
      ]
    end

    before do
      data_export.add_item(item1)
      data_export.add_item(item2)
      data_export.add_item(item3)
    end

    it 'output csv' do
      expect(subject).to eq result
    end
  end
end
