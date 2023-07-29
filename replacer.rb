require "replacer"
require "clipboard"
require "rainbow"

REPLACEMENT_LIST = {
  "FOO" => "BAR",
  "Foo" => "Bar",
  "フー" => "バー",
}

text = Clipboard.paste.encode("UTF-8")
color_text = text

REPLACEMENT_LIST.each do |src, dst|
  text = text.gsub(src, dst)
  color_text = color_text.gsub(src, Rainbow(dst).bg(:red))
end

puts color_text

# yes/no で実際にコピーするかキャンセルするかを確定したい
gets
Clipboard.copy(text)

# loop do
#   print "src> "
#   src = gets.chomp

#   print "dst> "
#   dst = gets.chomp

#   converted_text = text.gsub(src, dst)
#   puts text.gsub(src, Rainbow(dst).bg(:red))
#   Clipboard.copy(converted_text)

#   text = converted_text
# end