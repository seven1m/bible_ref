require_relative 'languages/cherokee'
require_relative 'languages/english'
require_relative 'languages/latin'
require_relative 'languages/portuguese'
require_relative 'languages/romanian'
require_relative 'languages/czech'

module BibleRef
  LANGUAGES = {
    'chr' => Languages::Cherokee,
    'eng' => Languages::English,
    'lat' => Languages::Latin,
    'por' => Languages::Portuguese,
    'ron' => Languages::Romanian,
    'cze' => Languages::Czech
  }.freeze
end
