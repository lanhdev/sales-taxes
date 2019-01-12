require_relative '../../app/models/item'
require_relative '../../app/decorators/format_number'
require_relative '../../lib/tax_rate'

describe Item do
  let(:item) { Item.new(quantity, product, price) }
  let(:quantity) { 1 }
  let(:product) { 'music cd' }
  let(:price) { 14.99 }

  describe 'taxes' do
    let(:subject) { item.taxes }
    
    it 'return taxes' do
      expect(subject).to eq 1.5
    end
  end

  describe 'price_with_taxes' do
    let(:subject) { item.price_with_taxes.round(2) }
    
    it 'return price with taxes' do
      expect(subject).to eq 16.49
    end
  end

  describe 'decorate' do
    let(:subject) { item.decorate }
    
    it 'return decorated item' do
      expect(subject).to eq [1, ' music cd', ' 16.49']
    end
  end
end
