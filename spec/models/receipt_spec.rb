require_relative '../../app/models/receipt'
require_relative '../../app/models/item'
require_relative '../../app/decorators/format_number'
require_relative '../../lib/tax_rate'

describe Receipt do
  let(:item1) { Item.new(1, 'book', 12.49) }
  let(:item2) { Item.new(1, 'music cd', 14.99) }
  let(:receipt) { Receipt.new }

  describe 'add_item' do
    let(:subject) { receipt.add_item(item1) }
    
    it 'has 1 item' do
      expect(subject[0]).to eq item1
      expect(subject[1]).to eq nil
    end
  end

  describe 'total_price_with_taxes' do
    let(:subject) { receipt.total_price_with_taxes }

    before do
      receipt.add_item(item1)
      receipt.add_item(item2)
    end
    
    it 'return total price with taxes' do
      expect(subject).to eq '28.98'
    end
  end

  describe 'total_taxes' do
    let(:subject) { receipt.total_taxes }

    before do
      receipt.add_item(item1)
      receipt.add_item(item2)
    end
    
    it 'return total taxes' do
      expect(subject).to eq '1.50'
    end
  end
end

