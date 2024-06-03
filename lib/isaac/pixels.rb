class Pixels
  def initialize(width, height)
    @matrix = Array.new(width) { Array.new(height) {} }
  end
  def []=(width, height, new_value)
    @matrix[width][height] = new_value
  end
  def [](width, height)
    @matrix[width][height]
  end
  def height
    @matrix.length
  end
  def width
    @matrix[0].length
  end
  def fill(item)
    if item.length != 1
      raise Isaac::Error("only single one can cope with it")
    end
    @matrix.each { |arr| arr = arr.fill(item)  }
  end
end
