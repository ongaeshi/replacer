require "clipboard"
require "rainbow"

is_second = false

loop do
  text = Clipboard.paste.encode("UTF-8")
  unless is_second
    print "text> "
    puts text
    is_second = true
  end

  print "src> "
  src = gets.chomp

  print "dst> "
  dst = gets.chomp

  converted_text = text.gsub(src, dst)
  puts converted_text.gsub(dst, Rainbow(dst).bg(:red))
  Clipboard.copy(converted_text)
end