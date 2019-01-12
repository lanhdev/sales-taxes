directories = %w(app lib)
directories.each do |directory|
  Dir.glob("./#{directory}/**/*.rb").each { |file| require file }
end

ReceiptPrinter.new.execute
