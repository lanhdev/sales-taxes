require_relative '../../lib/tax_rate'

describe TaxRate do
  let(:tax_rate) { TaxRate.new(product) }

  describe 'tax_rate' do
    context 'free tax product' do
      let(:product) { 'headache pills' }
      let(:subject) { tax_rate.tax_rate }

      it 'return tax rate' do
        expect(subject).to eq 0
      end
    end

    context 'imported and free tax product' do
      let(:product) { 'imported box of chocolates' }
      let(:subject) { tax_rate.tax_rate }

      it 'return tax rate' do
        expect(subject).to eq 0.05
      end
    end

    context 'imported and non free tax product' do
      let(:product) { 'imported bottle of perfume' }
      let(:subject) { tax_rate.tax_rate.round(2)}

      it 'return tax rate' do
        expect(subject).to eq 0.15
      end
    end
  end
end
