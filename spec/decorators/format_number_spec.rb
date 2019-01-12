require_relative '../../app/decorators/format_number'

describe FormatNumber do
  let(:formatter) { FormatNumber.new(number) }

  describe 'format_round' do
    let(:number) { 3.14 }
    let(:result) { formatter.format_round }

    it 'format number' do
      expect(result).to eq 3.15
    end
  end

  describe 'format_precision' do
    let(:number) { 3.1 }
    let(:result) { formatter.format_precision }

    it 'format number' do
      expect(result).to eq '3.10'
    end
  end
end
