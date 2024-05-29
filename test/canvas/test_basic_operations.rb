require "minitest/autorun"

describe "Basic canvas operations" do
  it "is initially empty" do
    canvas = Isaac::Canvas.new(5, 5)

    display = canvas.todo_get_display
    expected = "     \n" * 5

    assert_display_equals expected, display
  end

  it "fills the entire canvas with hashes" do
    canvas = Isaac::Canvas.new(5, 5)
    canvas.fill "#"

    display = canvas.todo_get_display
    expected = "#####\n" * 5

    assert_display_equals expected, display
  end

  it "clears the canvas" do
    canvas = Isaac::Canvas.new(5, 5)
    canvas.fill "#"
    canvas.clear

    display = canvas.todo_get_display
    expected = "     \n" * 5

    assert_display_equals expected, display
  end

  it "forbids assigning a new instance of an array to pixels" do
    assert_throws Isaac::Error do
      canvas.pixels = %w[1 2 3]
    end
  end

  it "can change pixels" do
    assert_throws
  end
end
