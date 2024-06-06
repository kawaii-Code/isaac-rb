require_relative "lib/isaac/canvas"
canvas = Isaac::Canvas.new(5, 5)
250.times do |y|
  x = y % 25
  canvas.clear
  canvas.draw_pixel(x / 5, x % 5, "#", Isaac::Color.new(255,0,0))#Isaac::Colors::RED
  canvas.display
  sleep 0.1
end
