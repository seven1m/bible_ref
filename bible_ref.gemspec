require_relative 'lib/bible_ref/version'

Gem::Specification.new do |s|
  s.name         = "bible_ref"
  s.version      = BibleRef::VERSION
  s.license      = "MIT"
  s.author       = "Tim Morgan"
  s.email        = "tim@timmorgan.org"
  s.homepage     = "https://github.com/seven1m/bible_ref"
  s.summary      = "Bible reference parser"
  s.description  = "Bible reference parser returns normalized sets of ranges, ideal for querying a database or XML data source such as WEB in USFX."
  s.files        = %w(README.md) + Dir['lib/**/*'].to_a
  s.require_path = "lib"
  s.add_dependency("parslet", "~> 1.6")
  s.add_development_dependency("rspec", "~> 3.0")
  s.add_development_dependency("pry", "~> 0.10.1")
end
