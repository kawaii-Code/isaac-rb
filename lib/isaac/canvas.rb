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
  def draw_pixel(width, height, new_value)
    @pixel [width, height] = new_value
  end

  def display()
  (system "cls") || (system "clear") #clears terminal
  print "\e[H\e[?25l" #hides cursor (its annoying)
  #puts "\x1b[48;2;#{@background_color[0]};#{@background_color[1]};#{@background_color[2]}m" #sets background color
  (@pixel.height).times do |i| 
      (@pixel.width).times { |j| print @pixel[i, j]  } #"\x1b[38;2;#{@color[i, j][0]};#{@color[i, j][1]};#{@color[i, j][2]}m",
      print "\n"
    end #draws every pixel
  end
  print "\e[H\e[?25h" #makes cursor visible
end
