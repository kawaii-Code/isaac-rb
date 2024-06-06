# Isaac

Isacc-rb is FREE and OPEN SOURCE ruby gem for drawing in terminal.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add isaac-rb

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install isaac-rb

## Usage
```ruby
require_relative "lib/isaac/canvas"
canvas = Isaac::Canvas.new(5, 5)
250.times do |y|
  x = y % 25
  canvas.clear
  canvas.draw_pixel(x / 5, x % 5, "#", Isaac::Color::RED)
  canvas.display
  sleep 0.1
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Code of Conduct

Everyone interacting in the Isaac project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kawaii-Code/isaac-rb/blob/main/CODE_OF_CONDUCT.md).
