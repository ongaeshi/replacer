require "replacer"
require "clipboard"
require "rainbow"
require "io/console"

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
puts
puts "Copy to clipboard? (YES ... ENTER/y, NO ... ESC/n)"

while (key = $stdin.getch) != "\C-c"
  case key
  when "y", "\r", "\n"
    Clipboard.copy(text)
    break
  when "n", "\e"
    break
  end
end
