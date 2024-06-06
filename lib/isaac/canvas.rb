# frozen_string_literal: true

require_relative "pixels"

module Isaac
  class Canvas
    attr_reader :pixels, :width, :height

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

    def draw_rect(x, y, width, height, symbol = "#", _color = "#FFFFFF")
      return if x.negative? || y.negative? || x >= @width || y >= @height

      (x..x + width - 1).each do |i|
        break if i >= @width

        @pixels[y, i] = symbol
        # @colors[i][y] = color

        next if y + height - 1 >= @height

        @pixels[y + height - 1, i] = symbol
        # @colors[i][y+height-1] = color
      end

      (y..y + height - 1).each do |j|
        break if j >= @height

        @pixels[j, x] = symbol
        # @colors[x][j] = color

        next if x + width - 1 >= @width

        @pixels[j, x + width - 1] = symbol
        # @colors[x+weight-1][j] = color
      end
    end

    def fill_rect(x, y, width, height, symbol = "#", _color = "#FFFFFF")
      return if x.negative? || y.negative? || x >= @width || y >= @height

      (x..x + width - 1).each do |i|
        (y..y + height - 1).each do |j|
          next if i >= @width || j >= @height

          @pixels[j, i] = symbol
          # @colors[i][j] = color
        end
      end
    end

    def draw_text(x, y, string, _color = "#FFFFFF", transporent_spaces = false)
      return if x.negative? || y.negative? || x >= @width || y >= @height

      first = x

      string.each_char do |char|
        break if y >= @height

        unless transporent_spaces && char == " "
          @pixels[y, x] = char
          # @colors[x][y] = color
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
