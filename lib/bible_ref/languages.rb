require_relative 'languages/cherokee'
require_relative 'languages/english'
require_relative 'languages/portuguese'
require_relative 'languages/romanian'

module BibleRef
  LANGUAGES = {
    'chr' => Languages::Cherokee,
    'eng' => Languages::English,
    'por' => Languages::Portuguese,
    'ron' => Languages::Romanian
  }
end
