require_relative '../lib/bible_ref'

RSpec.configure do |config|
  config.mock_with :rspec
  config.color = true
  config.order = 'random'
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
