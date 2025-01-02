# -*- coding: utf-8 -*-
require_relative '../spec_helper'

describe BibleRef::Reference do
  subject { BibleRef::Reference.new('John 3:16') }

  describe '#reference' do
    it 'returns the user-supplied reference' do
      expect(subject.reference).to eq('John 3:16')
    end

    context 'given a single chapter book' do
      subject { BibleRef::Reference.new('Philemon 8') }

      it 'standardizes the reference' do
        expect(subject.reference).to eq('Philemon 1:8')
      end
    end
  end

  describe '#valid?' do
    context 'given a known reference' do
      subject { BibleRef::Reference.new('John 3:16') }

      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'given an unknown book' do
      subject { BibleRef::Reference.new('Bad 4:1') }

      it 'is not valid' do
        expect(subject).to_not be_valid
      end
    end

    context 'given an poorly-formatted reference' do
      subject { BibleRef::Reference.new('foo12x34') }

      it 'is not valid' do
        expect(subject).to_not be_valid
      end
    end
  end

  describe '#ranges' do
    context 'given a single verse' do
      subject { BibleRef::Reference.new('John 3:16') }

      it 'returns a range with the same verse twice' do
        expect(subject.ranges).to eq([
          [{ book: 'JHN', chapter: 3, verse: 16 },
           { book: 'JHN', chapter: 3, verse: 16 }]
        ])
      end
    end

    context 'given a ranges of verses' do
      subject { BibleRef::Reference.new('1 John 5:11-12') }

      it 'returns a single range with first and last verse' do
        expect(subject.ranges).to eq([
          [{ book: '1JN', chapter: 5, verse: 11 },
           { book: '1JN', chapter: 5, verse: 12 }]
        ])
      end
    end

    context 'given a range with spaces' do
      subject { BibleRef::Reference.new('1 John 5:11-12') }

      it 'returns a single range with first and last verse' do
        expect(subject.ranges).to eq([
          [{ book: '1JN', chapter: 5, verse: 11 },
           { book: '1JN', chapter: 5, verse: 12 }]
        ])
      end
    end

    context 'given a complicated multi-chapter, multi-verse reference' do
      subject { BibleRef::Reference.new('Romans 12:1,3-4 & 13:2-4,7-8') }

      it 'returns all rangess in an array' do
        expect(subject.ranges).to eq([
          [{ book: 'ROM', chapter: 12, verse: 1 },
           { book: 'ROM', chapter: 12, verse: 1 }],
          [{ book: 'ROM', chapter: 12, verse: 3 },
           { book: 'ROM', chapter: 12, verse: 4 }],
          [{ book: 'ROM', chapter: 13, verse: 2 },
           { book: 'ROM', chapter: 13, verse: 4 }],
          [{ book: 'ROM', chapter: 13, verse: 7 },
           { book: 'ROM', chapter: 13, verse: 8 }]
        ])
      end
    end

    context 'given a book starting with a roman numeral' do
      subject { BibleRef::Reference.new('i Chronicles 10:1') }

      it 'returns 1 Chronicles 10:1' do
        expect(subject.ranges).to eq([
          [{ book: '1CH', chapter: 10, verse: 1 },
           { book: '1CH', chapter: 10, verse: 1 }]
        ])
      end
    end

    context 'given the book of Jude, properly formatted, with chapter and a single verse' do
      subject { BibleRef::Reference.new('Jude 1:3') }

      it 'returns the proper range' do
        expect(subject.ranges).to eq([
          [{ book: 'JUD', chapter: 1, verse: 3 },
           { book: 'JUD', chapter: 1, verse: 3 }]
        ])
      end
    end

    context 'given the book of Jude, properly formatted, with a single verse of 1' do
      subject { BibleRef::Reference.new('Jude 1') }

      it 'returns the proper range' do
        expect(subject.ranges).to eq([
          [{ book: 'JUD', chapter: 1, verse: 1 },
           { book: 'JUD', chapter: 1, verse: 1 }]
        ])
      end
    end

    context 'given the book of Jude, properly formatted, with a single numeral 1, with the option of single_chapter_book_matching: :indifferent' do
      subject { BibleRef::Reference.new('Jude 1', single_chapter_book_matching: :indifferent) }

      it 'returns the proper range' do
        expect(subject.ranges).to eq([
          [{ book: 'JUD', chapter: 1 },
           { book: 'JUD', chapter: 1 }]
        ])
      end
    end

    context 'given the book of Jude, improperly formatted, with a single verse' do
        subject { BibleRef::Reference.new('Jude 4') }

        it 'returns the proper range' do
          expect(subject.ranges).to eq([
              [{ book: 'JUD', chapter: 1, verse: 4 },
              { book: 'JUD', chapter: 1, verse: 4 }]
          ])
        end
    end

    context 'given the book of Jude, improperly formatted, with multiple verses' do
      subject { BibleRef::Reference.new('Jude 3,5,7') }

      it 'returns the proper range' do
        expect(subject.ranges).to eq([
          [{ book: 'JUD', chapter: 1, verse: 3 },
           { book: 'JUD', chapter: 1, verse: 3 }],
          [{ book: 'JUD', chapter: 1, verse: 5 },
           { book: 'JUD', chapter: 1, verse: 5 }],
          [{ book: 'JUD', chapter: 1, verse: 7 },
           { book: 'JUD', chapter: 1, verse: 7 }]
        ])
      end
    end

    context 'given the book of Obadiah, properly formatted, with a range of verses' do
      subject { BibleRef::Reference.new('Obadiah 1:1-5') }

      it 'returns the proper range' do
        expect(subject.ranges).to eq([
          [{ book: 'OBA', chapter: 1, verse: 1 },
           { book: 'OBA', chapter: 1, verse: 5 }]
        ])
      end
    end

    context 'given the book of Obadiah, improperly formatted, with a range of verses' do
      subject { BibleRef::Reference.new('Obadiah 3-8') }

      it 'returns the proper range' do
        expect(subject.ranges).to eq([
          [{ book: 'OBA', chapter: 1, verse: 3 },
           { book: 'OBA', chapter: 1, verse: 8 }]
        ])
      end
    end

    context 'given the book of Joannis II, properly formatted, with a range of verses' do
      subject { BibleRef::Reference.new('Joannis II 1:8-10', language: 'lat') }

      it 'returns the proper range' do
        expect(subject.ranges).to eq([
          [{ book: '2JN', chapter: 1, verse: 8 },
           { book: '2JN', chapter: 1, verse: 10 }]
        ])
      end
    end

    context 'given the book of Joannis II, improperly formatted, with a range of verses' do
      subject { BibleRef::Reference.new('Joannis II 4-9', language: 'lat') }

      it 'returns the proper range' do
        expect(subject.ranges).to eq([
          [{ book: '2JN', chapter: 1, verse: 4 },
           { book: '2JN', chapter: 1, verse: 9 }]
        ])
      end
    end

  end

  describe '#normalize' do
    context 'given only a chapter' do
      subject { BibleRef::Reference.new('jn 3') }

      it 'returns John 3' do
        expect(subject.normalize).to eq('John 3')
      end
    end

    context 'given a single chapter and several verses' do
      subject { BibleRef::Reference.new('jn 3:16, 17') }

      it 'returns John 3:16,17' do
        expect(subject.normalize).to eq('John 3:16,17')
      end
    end

    context 'given a multiple chapters and verses' do
      subject { BibleRef::Reference.new('JOHN 3:16-4:2,5&9') }

      it 'returns John 3:16-4:2' do
        expect(subject.normalize).to eq('John 3:16-4:2,3:5,9')
      end
    end

    context 'given a bad reference' do
      subject { BibleRef::Reference.new('nothing 10:1') }

      it 'returns nil' do
        expect(subject.normalize).to eq(nil)
      end
    end

    context 'given a book starting with a roman numeral' do
      subject { BibleRef::Reference.new('i chronicles 10:1') }

      it 'returns 1 Chronicles 10:1' do
        expect(subject.normalize).to eq('1 Chronicles 10:1')
      end
    end
  end

  describe '#book_id' do
    context 'given the full book name' do
      subject { BibleRef::Reference.new('John 1') }

      it 'returns the USFX identifier' do
        expect(subject.book_id).to eq('JHN')
      end
    end

    context 'given an abbreviated book' do
      subject { BibleRef::Reference.new('Ezr 1') }

      it 'returns the USFX identifier' do
        expect(subject.book_id).to eq('EZR')
      end
    end

    context 'given a book name starting with a roman numeral' do
      subject { BibleRef::Reference.new('ii chronicles 1') }

      it 'returns the USFX identifier' do
        expect(subject.book_id).to eq('2CH')
      end
    end

    context 'given a book name starting with an I' do
      subject { BibleRef::Reference.new('isaiah 1') }

      it 'returns the USFX identifier' do
        expect(subject.book_id).to eq('ISA')
      end
    end

    context 'given a book not in the canon' do
      subject { BibleRef::Reference.new('3 Maccabees 1', canon: 'protestant') }

      it 'returns nil' do
        expect(subject.book_id).to be_nil
      end
    end

    context 'given a book name in a supported language' do
      subject { BibleRef::Reference.new('João 1', language: 'por') }

      it 'returns the USFX identifier' do
        expect(subject.book_id).to eq('JHN')
      end
    end

    context 'given an exact book name in Cherokee' do
      subject { BibleRef::Reference.new('ᎣᏍᏛ ᎧᏃᎮᏛ ᏣᏂ ᎤᏬᏪᎳᏅᎯ 1', language: 'chr') }

      it 'returns the USFX identifier' do
        expect(subject.book_id).to eq('JHN')
      end
    end
  end

  describe '#book_name' do
    context 'given the book of John' do
      subject { BibleRef::Reference.new('1 Jn 1', language: 'eng', canon: 'protestant') }

      it 'returns the formatted book name' do
        expect(subject.book_name).to eq('1 John')
      end
    end

    context 'given the book of Tobit with the abbreviation "tob"' do
      subject { BibleRef::Reference.new('tob 1:1') }

      it 'returns the book of Tobit' do
        expect(subject.book_name).to eq('Tobit')
      end
    end

    context 'given the book of Tobit with no abbreviation' do
      subject { BibleRef::Reference.new('Tobit 1:1') }

      it 'returns the book of Tobit' do
        expect(subject.book_name).to eq('Tobit')
      end
    end

    context 'given the book of Judith with no abbreviation' do
      subject { BibleRef::Reference.new('judith 1:1') }

      it 'returns the book of Judith' do
        expect(subject.book_name).to eq('Judith')
      end
    end

    context 'given the book of Judith with no abbreviation and capitalization' do
      subject { BibleRef::Reference.new('Judith 1:1') }

      it 'returns the book of Judith' do
        expect(subject.book_name).to eq('Judith')
      end
    end

    context 'given the book of Judith with the abbreviation "jth"' do
      subject { BibleRef::Reference.new('jth 1:1') }

      it 'returns the book of Judith' do
        expect(subject.book_name).to eq('Judith')
      end
    end

    context 'given the book of Judith with the abbreviation "jdth"' do
      subject { BibleRef::Reference.new('jdth 1:1') }

      it 'returns the book of Judith' do
        expect(subject.book_name).to eq('Judith')
      end
    end


    context 'given the book of Judith with the abbreviation "jdt"' do
      subject { BibleRef::Reference.new('jdt 1:1') }

      it 'returns the book of Judith' do
        expect(subject.book_name).to eq('Judith')
      end
    end

    context 'given the book of Jude with the abbreviation "jud"' do
      subject { BibleRef::Reference.new('jud 1:1') }

      it 'returns the book of Jude' do
        expect(subject.book_name).to eq('Jude')
      end
    end

    context 'given the book of Jude with the abbreviation "jd"' do
      subject { BibleRef::Reference.new('jd 1:1') }

      it 'returns the book of Jude' do
        expect(subject.book_name).to eq('Jude')
      end
    end
    context 'given the book of Mark with an abbreviation Mk' do
      subject { BibleRef::Reference.new('Mk 1:5') }

      it 'returns the book of Mark' do
        expect(subject.book_name).to eq('Mark')
      end
    end

    context 'given the book of Mark with the full name' do
      subject { BibleRef::Reference.new('Mark 1:5') }

      it 'returns the book of Mark' do
        expect(subject.book_name).to eq('Mark')
      end
    end

    context 'given the book of Mark with the abbreviation mrk' do
      subject { BibleRef::Reference.new('Mrk 1:5') }

      it 'returns the book of Mark' do
        expect(subject.book_name).to eq('Mark')
      end
    end

    context 'given the book of Philemon with the full name' do
      subject { BibleRef::Reference.new('Philemon 1:1') }

      it 'returns the book of Philemon' do
        expect(subject.book_name).to eq('Philemon')
      end
    end

    context 'given the book of Philippians with the full name' do
      subject { BibleRef::Reference.new('Philippians 1:1') }

      it 'returns the book of Philippians' do
        expect(subject.book_name).to eq('Philippians')
      end
    end

    context 'given the book of Mark with an abbreviation Mk and translation Portuguese' do
      subject { BibleRef::Reference.new('Mk 1:5', language: 'por') }

      it 'returns the book of Marcos' do
        expect(subject.book_name).to eq('Marcos')
      end
    end

    context 'given the book of Mark with the full name and translation Portuguese' do
      subject { BibleRef::Reference.new('Mark 1:5', language: 'por') }

      it 'returns the book of Marcos' do
        expect(subject.book_name).to eq('Marcos')
      end
    end

    context 'given the book of Mark with an abbreviation Mk and translation Romanian' do
      subject { BibleRef::Reference.new('Mk 1:5', language: 'ron') }

      it 'returns the book of Marcu' do
        expect(subject.book_name).to eq('Marcu')
      end
    end

    context 'given the book of Mark with the full name and the translation Romanian' do
      subject { BibleRef::Reference.new('Mark 1:5', language: 'ron') }

      it 'returns the book of Marcu' do
        expect(subject.book_name).to eq('Marcu')
      end
    end
  end

end
