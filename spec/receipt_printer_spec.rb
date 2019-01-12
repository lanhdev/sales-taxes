describe ReceiptPrinter do
  let(:subject) { ReceiptPrinter.new(input_file).execute }

  describe 'execute' do
    context 'for input 1' do
      let(:input_file) { Dir.pwd + '/resources/input1.csv' }
      let(:result) do
        [
          [1, " book", " 12.49"],
          [1, " music cd", " 16.49"],
          [1, " chocolate bar", " 0.85"],
          ["Sales Taxes: 1.50"],
          ["Total: 29.83"]
        ]
      end

      it 'export the receipt' do
        expect(subject).to eq result
      end
    end

    context 'for input 2' do
      let(:input_file) { Dir.pwd + '/resources/input2.csv' }
      let(:result) do
        [
          [1, " imported box of chocolates", " 10.50"],
          [1, " imported bottle of perfume", " 54.65"],
          ["Sales Taxes: 7.65"],
          ["Total: 65.15"]
        ]
      end

      it 'export the receipt' do
        expect(subject).to eq result
      end
    end

    context 'for input 3' do
      let(:input_file) { Dir.pwd + '/resources/input3.csv' }
      let(:result) do
        [
          [1, " imported bottle of perfume", " 32.19"],
          [1, " bottle of perfume", " 20.89"],
          [1, " packet of headache pills", " 9.75"],
          [1, " box of imported chocolates", " 11.85"],
          ["Sales Taxes: 6.70"],
          ["Total: 74.68"]
        ]
      end

      it 'export the receipt' do
        expect(subject).to eq result
      end
    end
  end
end
