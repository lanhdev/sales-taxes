require 'csv'

class CSVImporter
  def initialize(data_import)
    @data_import = data_import
  end

  def import
    csv_array = CSV.read(data_import)
    parse_header_row(csv_array)
    receipt = Receipt.new

    csv_array.each do |row|
      next unless valided_row?(row)
      item = Item.new(row[0].to_i, row[1].strip, row[2].to_f)
      receipt.add_item(item)
    end

    receipt
  end

  private

  attr_reader :data_import

  def valided_row?(row)
    return false if row.any?(:empty?) || row.length != 3
    return false unless validate_number(row[0]) || validate_number(row[2])
    true
  end

  def validate_number(number)
    Float(number) != nil rescue false
  end

  def parse_header_row(csv_array)
    csv_array.shift
  end
end
