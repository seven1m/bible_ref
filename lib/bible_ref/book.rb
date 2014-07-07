module BibleRef

  class UnknownCanon < StandardError; end

  class Book

    CANONS = {
      protestant: %w(
        GEN EXO LEV NUM DEU JOS JDG RUT 1SA 2SA 1KI 2KI 1CH 2CH EZR NEH EST JOB PSA PRO ECC SNG ISA JER LAM EZK DAN HOS JOL AMO OBA JON MIC NAM HAB ZEP HAG ZEC MAL
        MAT MRK LUK JHN ACT ROM 1CO 2CO GAL EPH PHP COL 1TH 2TH 1TI 2TI TIT PHM HEB JAS 1PE 2PE 1JN 2JN 3JN JUD REV
      )
    }

    BOOKS = {
      'GEN' => /^gen/,
      'EXO' => /^ex/,
      'LEV' => /^le?v/,
      'NUM' => /^nu/,
      'DEU' => /^de?ut/,
      'JOS' => /^jos/,
      'JDG' => /^ju?dg/,
      'RUT' => /^ru/,
      '1SA' => /^1 sa?m/,
      '2SA' => /^2 sa?m/,
      '1KI' => /^1 (king|kgs)/,
      '2KI' => /^2 (king|kgs)/,
      '1CH' => /^1 chr/,
      '2CH' => /^2 chr/,
      'EZR' => /^ez/,
      'NEH' => /^ne/,
      'EST' => /^est/,
      'JOB' => /^jo?b/,
      'PSA' => /^ps/,
      'PRO' => /^pro?v/,
      'ECC' => /^ecc/,
      'SNG' => /^so?ng|^sol|^sg$/,
      'ISA' => /^isa/,
      'JER' => /^jer/,
      'LAM' => /^lam/,
      'EZK' => /^ez/,
      'DAN' => /^dan/,
      'HOS' => /^hos/,
      'JOL' => /^joel/,
      'AMO' => /^amo/,
      'OBA' => /^ob/,
      'JON' => /^jona/,
      'MIC' => /^mi/,
      'NAM' => /^nah/,
      'HAB' => /^hab/,
      'ZEP' => /^zep/,
      'HAG' => /^hag/,
      'ZEC' => /^zec/,
      'MAL' => /^mal/,
      'TOB' => /^tob/,
      'JDT' => /^jud/,
      'ESG' => /^est.*greek/,
      'WIS' => /^wisdom/,
      'SIR' => /^sir/,
      'BAR' => /^bar/,
      'LJE' => /^jeremy/,
      'S3Y' => /^3 holy/,
      'SUS' => /^sus/,
      'BEL' => /^bel/,
      '1MA' => /^1 mac/,
      '2MA' => /^2 mac/,
      '1ES' => /^1 esd/,
      'MAN' => /^prayer/,
      'PS2' => /^psalm 151/,
      '3MA' => /^3 mac/,
      '2ES' => /^2 esd/,
      '4MA' => /^4 mac/,
      'MAT' => /^mat/,
      'MRK' => /^ma?rk/,
      'LUK' => /^lu?k/,
      'JHN' => /^john|^jn/,
      'ACT' => /^act/,
      'ROM' => /^rom/,
      '1CO' => /^1 cor/,
      '2CO' => /^2 cor/,
      'GAL' => /^gal/,
      'EPH' => /^eph/,
      'PHP' => /^phil/,
      'COL' => /^col/,
      '1TH' => /^1 the?s/,
      '2TH' => /^2 the?s/,
      '1TI' => /^1 tim/,
      '2TI' => /^2 tim/,
      'TIT' => /^tit/,
      'PHM' => /^phi?l/,
      'HEB' => /^heb/,
      'JAS' => /^jam/,
      '1PE' => /^1 pet/,
      '2PE' => /^2 pet/,
      '1JN' => /^1 jo?h?n/,
      '2JN' => /^2 jo?h?n/,
      '3JN' => /^3 jo?h?n/,
      'JUD' => /^jud/,
      'REV' => /^re?v/
    }

    FORMATTED_BOOKS = {
      'GEN' => 'Genesis',
      'EXO' => 'Exodus',
      'LEV' => 'Leviticus',
      'NUM' => 'Numbers',
      'DEU' => 'Deuteronomy',
      'JOS' => 'Joshua',
      'JDG' => 'Judges',
      'RUT' => 'Ruth',
      '1SA' => '1 Samuel',
      '2SA' => '2 Samuel',
      '1KI' => '1 Kings',
      '2KI' => '2 Kings',
      '1CH' => '1 Chronicles',
      '2CH' => '2 Chronicles',
      'EZR' => 'Ezra',
      'NEH' => 'Nehemiah',
      'EST' => 'Esther',
      'JOB' => 'Job',
      'PSA' => 'Psalms',
      'PRO' => 'Proverbs',
      'ECC' => 'Ecclesiastes',
      'SNG' => 'Song of Solomon',
      'ISA' => 'Isaiah',
      'JER' => 'Jeremiah',
      'LAM' => 'Lamentations',
      'EZK' => 'Ezekiel',
      'DAN' => 'Daniel',
      'HOS' => 'Hosea',
      'JOL' => 'Joel',
      'AMO' => 'Amos',
      'OBA' => 'Obadiah',
      'JON' => 'Jonah',
      'MIC' => 'Micah',
      'NAM' => 'Nahum',
      'HAB' => 'Habakkuk',
      'ZEP' => 'Zephaniah',
      'HAG' => 'Haggai',
      'ZEC' => 'Zechariah',
      'MAL' => 'Malachi',
      'TOB' => 'Tobit',
      'JDT' => 'Judith',
      'ESG' => 'Esther (Greek)',
      'WIS' => 'Wisdom of Solomon',
      'SIR' => 'Sirach',
      'BAR' => 'Baruch',
      'LJE' => 'Jeremy’s Letter',
      'S3Y' => '3 Holy Children’s Song',
      'SUS' => 'Susanna',
      'BEL' => 'Bel and the Dragon',
      '1MA' => '1 Maccabees',
      '2MA' => '2 Maccabees',
      '1ES' => '1 Esdras',
      'MAN' => 'Prayer of Manasses',
      'PS2' => 'Psalm 151',
      '3MA' => '3 Maccabees',
      '2ES' => '2 Esdras',
      '4MA' => '4 Maccabees',
      'MAT' => 'Matthew',
      'MRK' => 'Mark',
      'LUK' => 'Luke',
      'JHN' => 'John',
      'ACT' => 'Acts',
      'ROM' => 'Romans',
      '1CO' => '1 Corinthians',
      '2CO' => '2 Corinthians',
      'GAL' => 'Galatians',
      'EPH' => 'Ephesians',
      'PHP' => 'Philippians',
      'COL' => 'Colossians',
      '1TH' => '1 Thessalonians',
      '2TH' => '2 Thessalonians',
      '1TI' => '1 Timothy',
      '2TI' => '2 Timothy',
      'TIT' => 'Titus',
      'PHM' => 'Philemon',
      'HEB' => 'Hebrews',
      'JAS' => 'James',
      '1PE' => '1 Peter',
      '2PE' => '2 Peter',
      '1JN' => '1 John',
      '2JN' => '2 John',
      '3JN' => '3 John',
      'JUD' => 'Jude',
      'REV' => 'Revelation'
    }

    def initialize(book, canon=:protestant)
      @canon = canon
      unless CANONS[@canon]
        raise UnknownCanon.new("#{canon} is not known. Canons this library support are: #{CANONS.join(', ')}")
      end
      @book = replace_roman_numerals(book).downcase
    end

    def id
      CANONS[@canon].each do |book|
        match = BOOKS[book]
        return book if @book =~ match
      end
      nil
    end

    def formatted
      FORMATTED_BOOKS[id]
    end

    private

    def replace_roman_numerals(book)
      book.sub!(/^iii/i, '3')
      book.sub!(/^ii/i, '2')
      book.sub!(/^i/i, '1')
      book
    end

  end
end
