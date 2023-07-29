require "replacer"
require "clipboard"
require "rainbow"
require "io/console"
require "yaml"
require "optparse"

params = {}
opt = OptionParser.new
opt.on("-e", "--edit")
opt.parse!(ARGV, into: params)

replacer_yml = File.join(File.dirname(__FILE__), "replacer.yml")

if params[:edit]
  `code #{replacer_yml}`
  puts "Open setting file '#{replacer_yml}'"
  exit(0)
end

# main
REPLACEMENT_LIST = YAML.load(File.read(replacer_yml))
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
