# -*- coding: utf-8 -*-
require_relative 'base'

module BibleRef
  module Languages
    class Romanian < Base

      # Is it a single chapter book?
      def has_single_chapter?(reference)
          matches = [/^ob/, /^iud/, /^2 io/, /^3 io/, /^fil/]
          return Regexp.union(matches).match?(reference.downcase)
      end

      def books
        {
          'GEN' => { match: /^gen/,             name: 'Geneza'                },
          'EXO' => { match: /^ex/,              name: 'Exodul'                },
          'LEV' => { match: /^le?v/,            name: 'Leviticul'             },
          'NUM' => { match: /^num/,             name: 'Numeri'                },
          'DEU' => { match: /^de?ut/,           name: 'Deuteronomul'          },
          'JOS' => { match: /^ios/,             name: 'Iosua'                 },
          'JDG' => { match: /^ju/,              name: 'Judecători'            },
          'RUT' => { match: /^ru/,              name: 'Rut'                   },
          '1SA' => { match: /^1 sa?m/,          name: '1 Samuel'              },
          '2SA' => { match: /^2 sa?m/,          name: '2 Samuel'              },
          '1KI' => { match: /^1 [iîÎ]/,         name: '1 Împăraţi'            },
          '2KI' => { match: /^2 [iîÎ]/,         name: '2 Împăraţi'            },
          '1CH' => { match: /^1 cr/,            name: '1 Cronici'             },
          '2CH' => { match: /^2 cr/,            name: '2 Cronici'             },
          'EZR' => { match: /^ezr/,             name: 'Ezra'                  },
          'NEH' => { match: /^ne/,              name: 'Neemia'                },
          'EST' => { match: /^est/,             name: 'Estera'                },
          'JOB' => { match: /^iov/,             name: 'Iov'                   },
          'PSA' => { match: /^ps/,              name: 'Psalmii'               },
          'PRO' => { match: /^pr/,              name: 'Proverbe'              },
          'ECC' => { match: /^ecl/,             name: 'Eclesiastul'           },
          'SNG' => { match: /^c[aâ]n$/,         name: 'Cântarea cântărilor'   },
          'ISA' => { match: /^isa/,             name: 'Isaia'                 },
          'JER' => { match: /^ier/,             name: 'Ieremia'               },
          'LAM' => { match: /^plâ/,             name: 'Plângerile lui Ieremia'},
          'EZK' => { match: /^ez/,              name: 'Ezechiel'              },
          'DAN' => { match: /^dan/,             name: 'Daniel'                },
          'HOS' => { match: /^os/,              name: 'Osea'                  },
          'JOL' => { match: /^ioel/,            name: 'Ioel'                  },
          'AMO' => { match: /^amo/,             name: 'Amos'                  },
          'OBA' => { match: /^ob/,              name: 'Obadia'                },
          'JON' => { match: /^iona/,            name: 'Iona'                  },
          'MIC' => { match: /^mi/,              name: 'Mica'                  },
          'NAM' => { match: /^nau/,             name: 'Naum'                  },
          'HAB' => { match: /^hab/,             name: 'Habacuc'               },
          'ZEP' => { match: /^[Ţţ̧]ef/,          name: 'Ţefania'               },
          'HAG' => { match: /^hag/,             name: 'Hagai'                 },
          'ZEC' => { match: /^za/,              name: 'Zaharia'               },
          'MAL' => { match: /^mal/,             name: 'Maleahi'               },
          'MAT' => { match: /^mat/,             name: 'Matei'                 },
          'MRK' => { match: /^(mar|mk)/,        name: 'Marcu'                 },
          'LUK' => { match: /^lu/,              name: 'Luca'                  },
          'JHN' => { match: /^io/,              name: 'Ioan'                  },
          'ACT' => { match: /^fa/,              name: 'Faptele apostolilor'   },
          'ROM' => { match: /^rom/,             name: 'Romani'                },
          '1CO' => { match: /^1 cor/,           name: '1 Corinteni'           },
          '2CO' => { match: /^2 cor/,           name: '2 Corinteni'           },
          'GAL' => { match: /^gal/,             name: 'Galateni'              },
          'EPH' => { match: /^ef/,              name: 'Efeseni'               },
          'PHP' => { match: /^fil/,             name: 'Filipeni'              },
          'COL' => { match: /^col/,             name: 'Coloseni'              },
          '1TH' => { match: /^1 te?s/,          name: '1 Tesaloniceni'        },
          '2TH' => { match: /^2 te?s/,          name: '2 Tesaloniceni'        },
          '1TI' => { match: /^1 tim/,           name: '1 Timotei'             },
          '2TI' => { match: /^2 tim/,           name: '2 Timotei'             },
          'TIT' => { match: /^tit/,             name: 'Tit'                   },
          'PHM' => { match: /^fil/,             name: 'Filimon'               },
          'HEB' => { match: /^ev/,              name: 'Evrei'                 },
          'JAS' => { match: /^iac/,             name: 'Iacov'                 },
          '1PE' => { match: /^1 pet/,           name: '1 Petru'               },
          '2PE' => { match: /^2 pet/,           name: '2 Petru'               },
          '1JN' => { match: /^1 io/,            name: '1 Ioan'                },
          '2JN' => { match: /^2 io/,            name: '2 Ioan'                },
          '3JN' => { match: /^3 io/,            name: '1 Ioan'                },
          'JUD' => { match: /^iud/,             name: 'Iuda'                  },
          'REV' => { match: /^apo/,             name: 'Apocalipsa'            }
        }
      end
    end
  end
end
