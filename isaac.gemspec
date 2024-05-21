# frozen_string_literal: true

require_relative "lib/isaac/version"

Gem::Specification.new do |spec|
  spec.name = "isaac-rb"
  spec.version = Isaac::VERSION
  spec.authors = ["kawaii-Code"]
  spec.email = ["nia.personal.0@gmail.com"]

  spec.summary = "A simple library for doing console graphics in ruby."
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://github.com/kawaii-Code/isaac-rb"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kawaii-Code/isaac-rb"
  spec.metadata["changelog_uri"] = "https://github.com/kawaii-Code/isaac-rb/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
end
