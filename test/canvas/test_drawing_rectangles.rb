require 'minitest/autorun'

describe 'Drawing rectangles' do
  it 'draws a fullscreen filled rectangle' do
    canvas = Isaac::Canvas.new(5, 5)
    canvas.fill_rect(0, 0, canvas.width, canvas.height, '#')

    display = canvas.inspect
    expected = "#####\n" * 5

    assert_display_equals expected, display
  end

  it 'draws a rectangle along the border' do
    canvas = Isaac::Canvas.new(5, 5)
    canvas.draw_rect(0, 0, canvas.width, canvas.height, '#')

    display = canvas.inspect
    expected = ""
    expected << "#####\n"
    expected << "#   #\n" * 3
    expected << "#####\n"

    assert_display_equals expected, display
  end

  it 'draws a 4x3 rectangle in the left upper corner' do
    canvas = Isaac::Canvas.new(5, 5)
    canvas.draw_rect(0, 0, 4, 3, '#')

    display = canvas.inspect
    expected = ""
    expected << "#### \n"
    expected << "#  # \n"
    expected << "#### \n"
    expected << "     \n"
    expected << "     \n"

    assert_display_equals expected, display
  end

  it 'fills a 4x3 rectangle at (1, 1)' do
    canvas = Isaac::Canvas.new(5, 5)
    canvas.fill_rect(1, 1, 4, 3, '#')

    display = canvas.inspect
    expected = ""
    expected << "     \n"
    expected << " ####\n"
    expected << " ####\n"
    expected << " ####\n"
    expected << "     \n"

    assert_display_equals expected, display
  end
end
