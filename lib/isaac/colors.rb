module Isaac
  class Color
    attr_reader :r, :g, :b
    
    def initialize(r, g, b)
      @r = r
      @g = g
      @b = b
    end
  end

  class Colors
    BLACK = Color.new(0, 0, 0)
    WHITE = Color.new(255, 255, 255)
    RED = Color.new(255, 0, 0)
    GREEN = Color.new(0, 255, 0)
    BLUE = Color.new(0, 0, 255)
    def initialize(width, height)
      @matrix = Array.new(width) { Array.new(height) }
      clear
    end

    def []=(width, height, new_value)
      raise Isaac::Error, "Can only use strings for Color!" unless new_value.is_a?(Color)

      @matrix[width][height] = new_value
    end

    def [](width, height)
      @matrix[width][height]
    end

    def clear
      @matrix.each { |arr| arr.fill(Colors::WHITE) }
    end

    def height
      @matrix.length
    end

    def width
      @matrix[0].length
    end

    def fill(item)
      raise Isaac::Error, "Can only use strings for Color!" unless new_value.is_a?(Color)

      @matrix.each { |arr| arr.fill(item) }
    end
  end

  private_constant :Colors
end
