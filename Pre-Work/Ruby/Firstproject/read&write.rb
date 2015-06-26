puts "What's the source file?"
source = gets.chomp
puts "What's the destination file?"
destination = gets.chomp
source_content = IO.read(source)
IO.write(destination, source_content)
