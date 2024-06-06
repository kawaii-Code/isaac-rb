# frozen_string_literal: true

require_relative "pixels"
require_relative "colors"

module Isaac
  # Screen representation.
  # Consists of a width x height matrix of pixels
  class Canvas
    attr_reader :pixels, :colors, :width, :height

    def initialize(width, height)
      @pixels = Pixels.new(width, height)
      @colors = Colors.new(width, height)
      @width = width
      @height = height
    end

    def clear
      @pixels.clear
    end

    def fill(item)
      @pixels.fill(item)
    end

    def draw_pixel(width, height, new_value, color = Colors::WHITE)
      @pixels[width, height] = new_value
      @colors[width, height] = color
    end

    def display
      (system "cls") || (system "clear") # clears terminal
      print "\e[H\e[?25l" # hides cursor (its annoying)
      # puts "\x1b[48;2;#{@background_color[0]};#{@background_color[1]};#{@background_color[2]}m" #sets background color
      @pixels.height.times do |i|
        @pixels.width.times do |j|
          print "\x1b[38;2;#{@colors[i, j].r};#{@colors[i, j].g};#{@colors[i, j].b}m",@pixels[i, j]
        end
        print "\n"
      end
      print "\x1b[0m"#resets
    end

    def draw_rect(x, y, width, height, symbol = "#", color = Colors::WHITE)
      return if x.negative? || y.negative? || x >= @width || y >= @height

      (x..x + width - 1).each do |i|
        break if i >= @width

        @pixels[y, i] = symbol
        @colors[y, i] = color

        next if y + height - 1 >= @height

        @pixels[y + height - 1, i] = symbol
        @colors[y + height - 1, i] = color
      end

      (y..y + height - 1).each do |j|
        break if j >= @height

        @pixels[j, x] = symbol
        @colors[j, x] = color

        next if x + width - 1 >= @width

        @pixels[j, x + width - 1] = symbol
        @colors[j, x + width - 1] = color
      end
    end

    def fill_rect(x, y, width, height, symbol = "#", color = Colors::WHITE)
      return if x.negative? || y.negative? || x >= @width || y >= @height

      (x..x + width - 1).each do |i|
        (y..y + height - 1).each do |j|
          next if i >= @width || j >= @height

          @pixels[j, i] = symbol
          @colors[j, i] = color
        end
      end
    end

    def draw_text(x, y, string, color = Colors::WHITE, transparent_spaces: false)
      return if x.negative? || y.negative? || x >= @width || y >= @height

      first = x

      string.each_char do |char|
        break if y >= @height

        unless transparent_spaces && char == " "
          @pixels[y, x] = char
          @colors[y, x] = color
        end
        x += 1

        if x >= @width
          x = first
          y += 1
        end
      end
    end
  end
end
