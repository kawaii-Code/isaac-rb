# frozen_string_literal: true
require_relative "pixels"

class Canvas
  def initialize(width, height)
    @pixel = Pixels.new(width, height)
  end
  def clear()
    @pixel.clear()
  end
  def fill(item)
    @pixel.fill(item)
  end
end
