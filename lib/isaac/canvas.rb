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

    def draw_rect(x, y, width, height, symbol='#',color="#FFFFFF")

      if x < 0 || y < 0 || x >= @width || y >= @height
          return
      end
  
      for i in (x..x+width-1)
  
          if i >= @width
              break
          end
  
          @pixels[y,i] = symbol
          #@colors[i][y] = color 
  
          if y+height-1 >= @height
              next
          end
  
          @pixels[y+height-1,i] = symbol
          #@colors[i][y+height-1] = color
  
      end
  
      for j in (y..y+height-1)
  
          if j >= @height
              break
          end
  
          @pixels[j,x] = symbol
          #@colors[x][j] = color 
  
          if x+width-1 >= @width
              next
          end
  
          @pixels[j,x+width-1] = symbol
          #@colors[x+weight-1][j] = color
          
      end
  end
  
  def fill_rect(x, y, width, height,symbol='#',color="#FFFFFF")
  
      if x < 0 || y < 0 || x >= @width || y >= @height
          return
      end
  
      for i in (x..x+width-1)
          for j in (y..y+height-1)
              if i >= @width || j >= @height
                  next
              end
              @pixels[j,i] = symbol
              #@colors[i][j] = color 
          end
      end
  end

  def draw_text (x, y, string, color="#FFFFFF", transporent_spaces=false)

    if x < 0 || y < 0 || x >= @width || y >= @height
        return
    end

    first = x
    
    string.each_char do |char|
        
      if y >= @height
          break
      end

      if transporent_spaces && char == ' '
          x = x+1
      else
          @pixels[y,x] = char
          #@colors[x][y] = color
          x = x+1
      end
      
      if x >= @width
          x = first
          y = y+1
      end

      end
    end
  end
end
