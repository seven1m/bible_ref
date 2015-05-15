require_relative 'languages/english'
require_relative 'languages/portuguese'

module BibleRef
  LANGUAGES = {
    'eng' => Languages::English,
    'por' => Languages::Portuguese
  }
end
