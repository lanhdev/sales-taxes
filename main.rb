require './app/receipt_printer.rb'
require './lib/csv_importer.rb'
require './lib/csv_exporter.rb'
require './lib/tax_rate.rb'
require './app/decorators/format_number.rb'
require './app/models/item.rb'
require './app/models/receipt.rb'

ReceiptPrinter.new.execute
