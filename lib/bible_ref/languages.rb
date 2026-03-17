require_relative 'languages/arabic'
require_relative 'languages/cherokee'
require_relative 'languages/chinese'
require_relative 'languages/czech'
require_relative 'languages/english'
require_relative 'languages/italian'
require_relative 'languages/latin'
require_relative 'languages/portuguese'
require_relative 'languages/romanian'
require_relative 'languages/russian'
require_relative 'languages/spanish'

module BibleRef
  LANGUAGES = {
    'ara' => Languages::Arabic,
    'chr' => Languages::Cherokee,
    'zh-tw' => Languages::Chinese,
    'cze' => Languages::Czech,
    'eng' => Languages::English,
    'ita' => Languages::Italian,
    'lat' => Languages::Latin,
    'por' => Languages::Portuguese,
    'ron' => Languages::Romanian,
    'rus' => Languages::Russian,
    'spa' => Languages::Spanish,
  }.freeze
end
