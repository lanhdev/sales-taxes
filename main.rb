directories = %w(app lib)
directories.each do |directory|
  Dir.glob("./#{directory}/**/*.rb").each do { |file| require file }
end

ReceiptPrinter.new.execute
