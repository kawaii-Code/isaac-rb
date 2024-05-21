# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "isaac"

require "minitest/autorun"

def assert_display_equals(expected, actual)
  (1..expected.length).each do |i|
    assert_equal expected[i], actual[i]
  end
end
