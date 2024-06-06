# frozen_string_literal: true

require_relative "pixels"

class Canvas
  def initialize(width, height)
    @pixel = Pixels.new(width, height)
  end

  def clear
    @pixel.clear
  end

  def fill(item)
    @pixel.fill(item)
  end

  def draw_pixel(width, height, new_value)
    @pixel[width, height] = new_value
  end

  def display
    (system "cls") || (system "clear") # clears terminal
    print "\e[H\e[?25l" # hides cursor (its annoying)
    # puts "\x1b[48;2;#{@background_color[0]};#{@background_color[1]};#{@background_color[2]}m" #sets background color
    @pixel.height.times do |i|
      # "\x1b[38;2;#{@color[i, j][0]};#{@color[i, j][1]};#{@color[i, j][2]}m",
      @pixel.width.times do |j|
        print @pixel[i, j]
      end
      print "\n"
    end
    print "\e[H\e[?25h" # makes cursor visible
  end

  def todo_get_display
    displ = "".dup
    @pixel.height.times do |i|
      @pixel.width.times { |j| displ << @pixel[i, j].to_str }
      displ << "\n"
    end
    displ
  end
end
