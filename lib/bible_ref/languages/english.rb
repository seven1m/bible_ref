# -*- coding: utf-8 -*-
require_relative 'base'

module BibleRef
  module Languages
    class English < Base
      # Is it a single chapter book?
      def has_single_chapter?(reference)
        matches = [/^ob/, /^(jud|jd|jude)\b/, /^2 ?jo?h?n/, /^3 ?jo?h?n/, /^(philem|phm|pm)/]
        return Regexp.union(matches).match?(reference.downcase)
      end

      def books
        {
          'GEN' => { match: /^gen/,              name: 'Genesis'                },
          'EXO' => { match: /^ex/,               name: 'Exodus'                 },
          'LEV' => { match: /^le?v/,             name: 'Leviticus'              },
          'NUM' => { match: /^nu/,               name: 'Numbers'                },
          'DEU' => { match: /^d(e?ut|eu)/,       name: 'Deuteronomy'            },
          'JOS' => { match: /^jos/,              name: 'Joshua'                 },
          'JDG' => { match: /^ju?dg/,            name: 'Judges'                 },
          'RUT' => { match: /^ru/,               name: 'Ruth'                   },
          '1SA' => { match: /^1 ?s(a?m|a)/,      name: '1 Samuel'               },
          '2SA' => { match: /^2 ?s(a?m|a)/,      name: '2 Samuel'               },
          '1KI' => { match: /^1 ?(king|kgs|ki)/, name: '1 Kings'                },
          '2KI' => { match: /^2 ?(king|kgs|ki)/, name: '2 Kings'                },
          '1CH' => { match: /^1 ?chr?/,          name: '1 Chronicles'           },
          '2CH' => { match: /^2 ?chr?/,          name: '2 Chronicles'           },
          'EZR' => { match: /^ezr/,              name: 'Ezra'                   },
          'NEH' => { match: /^ne/,               name: 'Nehemiah'               },
          'EST' => { match: /^est/,              name: 'Esther'                 },
          'JOB' => { match: /^jo?b/,             name: 'Job'                    },
          'PSA' => { match: /^ps/,               name: 'Psalms'                 },
          'PRO' => { match: /^(pro?v|pro)/,      name: 'Proverbs'               },
          'ECC' => { match: /^ecc/,              name: 'Ecclesiastes'           },
          'SNG' => { match: /^so?ng|^sol|^sg$/,  name: 'Song of Solomon'        },
          'ISA' => { match: /^isa/,              name: 'Isaiah'                 },
          'JER' => { match: /^jer/,              name: 'Jeremiah'               },
          'LAM' => { match: /^lam/,              name: 'Lamentations'           },
          'EZK' => { match: /^ez(e|k)/,          name: 'Ezekiel'                },
          'DAN' => { match: /^dan/,              name: 'Daniel'                 },
          'HOS' => { match: /^hos/,              name: 'Hosea'                  },
          'JOL' => { match: /^joe?l/,            name: 'Joel'                   },
          'AMO' => { match: /^amo/,              name: 'Amos'                   },
          'OBA' => { match: /^ob/,               name: 'Obadiah'                },
          'JON' => { match: /^jona?/,            name: 'Jonah'                  },
          'MIC' => { match: /^mi/,               name: 'Micah'                  },
          'NAM' => { match: /^na(h|m)/,          name: 'Nahum'                  },
          'HAB' => { match: /^hab/,              name: 'Habakkuk'               },
          'ZEP' => { match: /^zep/,              name: 'Zephaniah'              },
          'HAG' => { match: /^hag/,              name: 'Haggai'                 },
          'ZEC' => { match: /^zec/,              name: 'Zechariah'              },
          'MAL' => { match: /^mal/,              name: 'Malachi'                },
          'TOB' => { match: /^tob/,              name: 'Tobit'                  },
          'JDT' => { match: /^(jth|jdth?|judith)/, name: 'Judith'                 },
          'ESG' => { match: /^(est.*greek|esg)/, name: 'Esther (Greek)'         },
          'WIS' => { match: /^wis(dom)?/,        name: 'Wisdom of Solomon'      },
          'SIR' => { match: /^sir/,              name: 'Sirach'                 },
          'BAR' => { match: /^bar/,              name: 'Baruch'                 },
          'LJE' => { match: /^(jeremy|lje)/,     name: 'Jeremy’s Letter'        },
          'S3Y' => { match: /^(3 holy|s3y)/,     name: '3 Holy Children’s Song' },
          'SUS' => { match: /^sus/,              name: 'Susanna'                },
          'BEL' => { match: /^bel/,              name: 'Bel and the Dragon'     },
          '1MA' => { match: /^1 ?mac?/,          name: '1 Maccabees'            },
          '2MA' => { match: /^2 ?mac?/,          name: '2 Maccabees'            },
          '1ES' => { match: /^1 ?esd?/,          name: '1 Esdras'               },
          'MAN' => { match: /^(prayer|man)/,     name: 'Prayer of Manasses'     },
          'PS2' => { match: /^(psalm 151|ps2)/,  name: 'Psalm 151'              },
          '3MA' => { match: /^3 ?mac?/,          name: '3 Maccabees'            },
          '2ES' => { match: /^2 ?esd?/,          name: '2 Esdras'               },
          '4MA' => { match: /^4 ?mac?/,          name: '4 Maccabees'            },
          'MAT' => { match: /^mat/,              name: 'Matthew'                },
          'MRK' => { match: /^(ma?rk|mk)/,       name: 'Mark'                   },
          'LUK' => { match: /^lu?k/,             name: 'Luke'                   },
          'JHN' => { match: /^(john|jn|jhn)/,    name: 'John'                   },
          'ACT' => { match: /^act/,              name: 'Acts'                   },
          'ROM' => { match: /^rom/,              name: 'Romans'                 },
          '1CO' => { match: /^1 ?cor?/,          name: '1 Corinthians'          },
          '2CO' => { match: /^2 ?cor?/,          name: '2 Corinthians'          },
          'GAL' => { match: /^gal/,              name: 'Galatians'              },
          'EPH' => { match: /^eph/,              name: 'Ephesians'              },
          'PHP' => { match: /^(phil|php|pp)/,    name: 'Philippians'            },
          'COL' => { match: /^col/,              name: 'Colossians'             },
          '1TH' => { match: /^1 ?the?s?/,        name: '1 Thessalonians'        },
          '2TH' => { match: /^2 ?the?s?/,        name: '2 Thessalonians'        },
          '1TI' => { match: /^1 ?tim?/,          name: '1 Timothy'              },
          '2TI' => { match: /^2 ?tim?/,          name: '2 Timothy'              },
          'TIT' => { match: /^tit/,              name: 'Titus'                  },
          'PHM' => { match: /^(philem|phm|pm)/,  name: 'Philemon'               },
          'HEB' => { match: /^heb/,              name: 'Hebrews'                },
          'JAS' => { match: /^ja(m|s)/,          name: 'James'                  },
          '1PE' => { match: /^1 ?pet?/,          name: '1 Peter'                },
          '2PE' => { match: /^2 ?pet?/,          name: '2 Peter'                },
          '1JN' => { match: /^1 ?jo?h?n/,        name: '1 John'                 },
          '2JN' => { match: /^2 ?jo?h?n/,        name: '2 John'                 },
          '3JN' => { match: /^3 ?jo?h?n/,        name: '3 John'                 },
          'JUD' => { match: /^(jud|jd|jude)$/,   name: 'Jude'                   },
          'REV' => { match: /^re?v/,             name: 'Revelation'             }
        }
      end
    end
  end
end
