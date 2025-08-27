require_relative 'languages/cherokee'
require_relative 'languages/chinese'
require_relative 'languages/czech'
require_relative 'languages/english'
require_relative 'languages/latin'
require_relative 'languages/portuguese'
require_relative 'languages/romanian'
require_relative 'languages/russian'
require_relative 'languages/spanish'

module BibleRef
  LANGUAGES = {
    'chr' => Languages::Cherokee,
    'zh-tw' => Languages::Chinese,
    'cze' => Languages::Czech,
    'eng' => Languages::English,
    'lat' => Languages::Latin,
    'por' => Languages::Portuguese,
    'ron' => Languages::Romanian,
    'rus' => Languages::Russian,
    'spa' => Languages::Spanish,
  }.freeze
end
