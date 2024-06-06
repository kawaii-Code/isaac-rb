# frozen_string_literal: true

require_relative "pixels"

module Isaac
  class Canvas
    attr_reader :pixels
    attr_reader :width
    attr_reader :height

    def initialize(width, height)
      @pixels = Pixels.new(width, height)
      @width = width
      @height = height
    end

    def clear
      @pixels.clear
    end

    def fill(item)
      @pixels.fill(item)
    end

    def draw_pixel(width, height, new_value)
      @pixels[width, height] = new_value
    end

    def display
      (system "cls") || (system "clear") # clears terminal
      print "\e[H\e[?25l" # hides cursor (its annoying)
      # puts "\x1b[48;2;#{@background_color[0]};#{@background_color[1]};#{@background_color[2]}m" #sets background color
      @pixels.height.times do |i|
        # "\x1b[38;2;#{@color[i, j][0]};#{@color[i, j][1]};#{@color[i, j][2]}m",
        @pixels.width.times do |j|
          print @pixels[i, j]
        end
        print "\n"
      end
      print "\e[H\e[?25h" # makes cursor visible
    end

    def todo_get_display
      displ = "".dup
      @pixels.height.times do |i|
        @pixels.width.times { |j| displ << @pixels[i, j].to_str }
        displ << "\n"
      end
      displ
    end
  end
end
