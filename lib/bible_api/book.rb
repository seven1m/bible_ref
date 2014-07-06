module BibleApi

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

    def initialize(book, canon=:protestant)
      @canon = canon
      unless CANONS[@canon]
        raise UnknownCanon.new("#{canon} is not known. Canons this library support are: #{CANONS.join(', ')}")
      end
      @book = book
    end

    def id
      CANONS[@canon].each do |book|
        match = BOOKS[book]
        return book if @book.downcase =~ match
      end
      nil
    end

  end
end
