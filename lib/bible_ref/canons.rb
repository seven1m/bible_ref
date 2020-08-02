require_relative 'canons/protestant'
require_relative 'canons/all'
module BibleRef
  CANONS = {
    'protestant' => Canons::Protestant,
    'all' => Canons::All
  }
end
