# frozen_string_literal: true
# -*- coding: utf-8 -*-
require_relative 'base'

module BibleRef
  module Languages
    class Czech < Base
      # Is it a single chapter book?
      def has_single_chapter?(reference)
        matches = [/^ab/, /^(jud|juda)$/, /^2 ?jan/, /^3 ?jan/, /^fil/]
        Regexp.union(matches).match?(reference.downcase)
      end

      def books
        {
          'GEN' => { match: /^gen/,              name: 'Genesis'                },
          'EXO' => { match: /^ex/,               name: 'Exodus'                 },
          'LEV' => { match: /^le?v/,             name: 'Leviticus'              },
          'NUM' => { match: /^nu/,               name: 'Numeri'                 },
          'DEU' => { match: /^d(e?ut|eu)/,       name: 'Deuteronomium'          },
          'JOS' => { match: /^joz/,              name: 'Jozue'                  },
          'JDG' => { match: /^soud/,             name: 'Soudců'                 },
          'RUT' => { match: /^ru/,               name: 'Rút'                    },
          '1SA' => { match: /^1 ?s(a?m)?/,       name: '1. Samuel'              },
          '2SA' => { match: /^2 ?s(a?m)?/,       name: '2. Samuel'              },
          '1KI' => { match: /^1 ?kr(a?l)?/,      name: '1. Královská'           },
          '2KI' => { match: /^2 ?kr(a?l)?/,      name: '2. Královská'           },
          '1CH' => { match: /^1 ?p(ar)?/,        name: '1. Paralipomenon'       },
          '2CH' => { match: /^2 ?p(ar)?/,        name: '2. Paralipomenon'       },
          'EZR' => { match: /^ezr/,              name: 'Ezdráš'                 },
          'NEH' => { match: /^ne/,               name: 'Nehemiáš'               },
          'EST' => { match: /^est/,              name: 'Ester'                  },
          'JOB' => { match: /^jo?b/,             name: 'Job'                    },
          'PSA' => { match: /^za/,               name: 'Žalmy'                  },
          'PRO' => { match: /^pri/,              name: 'Přísloví'               },
          'ECC' => { match: /^kaz/,              name: 'Kazatel'                },
          'SNG' => { match: /^pis/,              name: 'Píseň písní'            },
          'ISA' => { match: /^iza/,              name: 'Izaiáš'                 },
          'JER' => { match: /^jer/,              name: 'Jeremiáš'               },
          'LAM' => { match: /^plac/,             name: 'Pláč'                   },
          'EZK' => { match: /^eze/,              name: 'Ezechiel'               },
          'DAN' => { match: /^dan/,              name: 'Daniel'                 },
          'HOS' => { match: /^oze/,              name: 'Ozeáš'                  },
          'JOL' => { match: /^joe?l/,            name: 'Joel'                   },
          'AMO' => { match: /^amo/,              name: 'Amos'                   },
          'OBA' => { match: /^ab/,               name: 'Abdiáš'                 },
          'JON' => { match: /^jona?/,            name: 'Jonáš'                  },
          'MIC' => { match: /^mi/,               name: 'Micheáš'                },
          'NAM' => { match: /^na(h|m)/,          name: 'Nahum'                  },
          'HAB' => { match: /^aba/,              name: 'Abakuk'                 },
          'ZEP' => { match: /^sof/,              name: 'Sofoniáš'               },
          'HAG' => { match: /^ag/,               name: 'Ageus'                  },
          'ZEC' => { match: /^zac/,              name: 'Zachariáš'              },
          'MAL' => { match: /^mal/,              name: 'Malachiáš'              },
          'MAT' => { match: /^ma?t/,             name: 'Matouš'                 },
          'MRK' => { match: /^ma?rk/,            name: 'Marek'                  },
          'LUK' => { match: /^lu?k/,             name: 'Lukáš'                  },
          'JHN' => { match: /^j(an|n)/,          name: 'Jan'                    },
          'ACT' => { match: /^sku/,              name: 'Skutky'                 },
          'ROM' => { match: /^rim/,              name: 'Římanům'                },
          '1CO' => { match: /^1 ?kor/,           name: '1. Korintským'          },
          '2CO' => { match: /^2 ?kor/,           name: '2. Korintským'          },
          'GAL' => { match: /^gal/,              name: 'Galatským'              },
          'EPH' => { match: /^ef/,               name: 'Efeským'                },
          'PHP' => { match: /^filip/,            name: 'Filipským'              },
          'COL' => { match: /^kol/,              name: 'Koloským'               },
          '1TH' => { match: /^1 ?tes/,           name: '1. Tesalonickým'        },
          '2TH' => { match: /^2 ?tes/,           name: '2. Tesalonickým'        },
          '1TI' => { match: /^1 ?tim/,           name: '1. Timoteovi'           },
          '2TI' => { match: /^2 ?tim/,           name: '2. Timoteovi'           },
          'TIT' => { match: /^tit/,              name: 'Titovi'                 },
          'PHM' => { match: /^fil/,              name: 'Filemonovi'             },
          'HEB' => { match: /^zid/,              name: 'Židům'                  },
          'JAS' => { match: /^jak/,              name: 'Jakub'                  },
          '1PE' => { match: /^1 ?pet/,           name: '1. Petr'                },
          '2PE' => { match: /^2 ?pet/,           name: '2. Petr'                },
          '1JN' => { match: /^1 ?jan/,           name: '1. Jan'                 },
          '2JN' => { match: /^2 ?jan/,           name: '2. Jan"'                },
          '3JN' => { match: /^3 ?jan/,           name: '3. Jan'                 },
          'JUD' => { match: /^(jud|juda)$/,      name: 'Juda'                   },
          'REV' => { match: /^zj(e)?/,           name: 'Zjevení'                }
        }
      end
    end
  end
end
