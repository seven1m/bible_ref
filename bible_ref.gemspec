require_relative 'lib/bible_ref/version'

Gem::Specification.new do |s|
  s.name         = "bible_ref"
  s.version      = BibleRef::VERSION
  s.author       = "Tim Morgan"
  s.email        = "tim@timmorgan.org"
  s.homepage     = "https://github.com/seven1m/bible_ref"
  s.summary      = "Bible reference parser"
  s.files        = %w(README.md) + Dir['lib/**/*'].to_a
  s.require_path = "lib"
  s.has_rdoc     = true
  s.add_dependency("usfx", "~> 0.1.0")
  s.add_dependency("parslet", "~> 1.6.0")
  s.add_development_dependency("rspec", "~> 3.0.0")
end
