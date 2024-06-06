module Isaac
  class Pixels
    def initialize(width, height)
      @matrix = Array.new(width) { Array.new(height) }
      clear
    end

    def []=(width, height, new_value)
      raise Isaac::Error, "Can only use strings for pixels!" unless new_value.is_a?(String)
      raise Isaac::Error, "Pixel must be a single character!" if new_value.length != 1

      @matrix[width][height] = new_value.to_s
    end

    def [](width, height)
      @matrix[width][height]
    end

    def clear
      @matrix.each { |arr| arr.fill(" ") }
    end

    def height
      @matrix.length
    end

    def width
      @matrix[0].length
    end

    def fill(item)
      raise Isaac::Error, "only single one can cope with it" if item.length != 1

      @matrix.each { |arr| arr.fill(item.to_s) }
    end
  end
end
