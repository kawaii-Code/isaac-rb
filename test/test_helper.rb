$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "isaac"

require "minitest/autorun"

def collect_pixels_to_string(canvas)
  string = ""
  (0..canvas.height - 1).each do |row|
    (0..canvas.width - 1).each do |col|
      string << canvas.pixels[row, col]
    end
    string << "\n"
  end
  string
end

def assert_display_equals(expected, actual)
  assert_equal expected, actual
end
