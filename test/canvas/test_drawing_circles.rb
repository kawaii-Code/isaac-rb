require "minitest/autorun"

# describe "Drawing circles" do
#  it "draws a radius 2 circle at (2, 2)" do
#    canvas = Isaac::Canvas.new(5, 5)
#    canvas.draw_circle(2, 2, 2, "#")
#
#    display = canvas.todo_get_display
#
#    # Центр находится в (2, 2). Радиус - 2.
#    expected = ""
#    expected << "     \n"
#    expected << "  #  \n"
#    expected << " # # \n"
#    expected << "  #  \n"
#    expected << "     \n"
#
#    assert_display_equals expected, display
#  end
#
#  it "fills a radius 2 circle at (2, 2)" do
#    canvas = Isaac::Canvas.new(5, 5)
#    canvas.fill_circle(2, 2, 2, "#")
#
#    display = canvas.todo_get_display
#
#    # Центр находится в (2, 2). Радиус - 2.
#    expected = ""
#    expected << "     \n"
#    expected << "  #  \n"
#    expected << " ### \n"
#    expected << "  #  \n"
#    expected << "     \n"
#
#    # assert_display_equals expected, display
#  end
# end
