$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "isaac"

require "minitest/autorun"

def collect_pixels_to_string(canvas)
  string = ""
  for row in 0..canvas.height - 1
    for col in 0..canvas.width - 1
      string << canvas.pixels[row, col]
    end
    string << "\n"
  end
  return string
end

def assert_display_equals(expected, actual)
  assert_equal expected, actual
end
