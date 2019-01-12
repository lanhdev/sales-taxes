directories = %w(app lib)
directories.each do |directory|
  Dir.glob("./#{directory}/**/*.rb").each { |file| require file }
end

input_file = ARGV[0]
ReceiptPrinter.new(input_file).execute
