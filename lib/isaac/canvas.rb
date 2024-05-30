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
  #puts "\x1b[48;2;#{@background_color[0]};#{@background_color[1]};#{@background_color[2]}m" #sets background color
  @pixel.matrix.each_with_index do |arr, i| 
      arr.each_with_index { |x, j| print =begin"\x1b[38;2;#{@color[i, j][0]};#{@color[i, j][1]};#{@color[i, j][2]}m"=end,x  }
      puts  
    end #draws every pixel
  end
end
