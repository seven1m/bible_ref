require_relative 'lib/bible_api'

Gem::Specification.new do |s|
  s.name         = "bible_api"
  s.version      = BibleApi::VERSION
  s.author       = "Tim Morgan"
  s.email        = "tim@timmorgan.org"
  s.homepage     = "https://github.com/seven1m/bible-api"
  s.summary      = "World English Bible (WEB) API as a Sinatra app + tools for querying bible XML"
  s.files        = %w(README.md) + Dir['lib/**/*'].to_a
  s.require_path = "lib"
  s.has_rdoc     = true
  s.add_dependency("usfx", "~> 0.1.0")
  s.add_dependency("parslet", "~> 1.6.0")
  s.add_development_dependency("rspec", "~> 3.0.0")
end
