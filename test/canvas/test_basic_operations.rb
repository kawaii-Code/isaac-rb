require "minitest/autorun"

describe "Basic canvas operations" do
  it "is initially empty" do
    canvas = Isaac::Canvas.new(5, 5)

    pixels = collect_pixels_to_string canvas
    expected = "     \n" * 5

    assert_display_equals expected, pixels
  end

  it "fills the entire canvas with hashes" do
    canvas = Isaac::Canvas.new(5, 5)
    canvas.fill "#"

    pixels = collect_pixels_to_string canvas
    expected = "#####\n" * 5

    assert_display_equals expected, pixels
  end

  it "clears the canvas" do
    canvas = Isaac::Canvas.new(5, 5)
    canvas.fill "#"
    canvas.clear

    pixels = collect_pixels_to_string canvas
    expected = "     \n" * 5

    assert_display_equals expected, pixels
  end

  it "forbids assigning a new instance of an array to pixels" do
    canvas = Isaac::Canvas.new(5, 5)

    assert_raises NoMethodError do
      canvas.pixels = %w[1 2 3]
    end
  end

  it "can change pixels" do
    canvas = Isaac::Canvas.new(2, 2)
    canvas.pixels[1, 1] = '#'

    pixels = collect_pixels_to_string canvas
    expected = "  \n #\n"
  end
end
