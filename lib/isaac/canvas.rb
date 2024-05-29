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

  def display()
  puts "\x1b[2J" #clears terminal
  #puts "\x1b[48;2;200;0;0m" #sets background color
  @matrix.each { |arr| arr.each { |x| print =begin"\x1b[38;2;2;2;2m"=end,x  }; puts  } #draws every pixel
  end
end
