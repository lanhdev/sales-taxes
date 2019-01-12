require_relative '../../app/models/receipt'
require_relative '../../app/models/item'
require_relative '../../app/decorators/format_number'
require_relative '../../lib/tax_rate'
require_relative '../../lib/csv_importer'

describe CSVImporter do
  let(:importer) { CSVImporter.new(data_import) }
  let(:data_import) { Dir.pwd + '/input/input1.csv' }

  describe 'import' do
    let(:item1) { Item.new(1, 'book', 12.49) }
    let(:item2) { Item.new(1, 'music cd', 14.99) }
    let(:item3) { Item.new(1, 'chocolate bar', 0.85) }
    let(:receipt) { Receipt.new }
    let(:subject) { importer.import }

    before do
      receipt.add_item(item1)
      receipt.add_item(item2)
      receipt.add_item(item3)
    end

    it 'return receipt' do
      expect(subject.items[0].quantity).to eq 1
      expect(subject.items[0].product).to eq 'book'
      expect(subject.items[0].price).to eq 12.49
      expect(subject.items[1].quantity).to eq 1
      expect(subject.items[1].product).to eq 'music cd'
      expect(subject.items[1].price).to eq 14.99
      expect(subject.items[2].quantity).to eq 1
      expect(subject.items[2].product).to eq 'chocolate bar'
      expect(subject.items[2].price).to eq 0.85
    end
  end
end
