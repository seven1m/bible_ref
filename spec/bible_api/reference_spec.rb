require_relative '../../lib/bible_api/reference'

describe BibleApi::Reference do

  subject { BibleApi::Reference.new('John 3:16') }

  describe '#reference' do
    it 'returns the user-supplied reference' do
      expect(subject.reference).to eq('John 3:16')
    end
  end

  describe '#valid?' do
    context 'given a known reference' do
      subject { BibleApi::Reference.new('John 3:16') }

      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'given an unknown book' do
      subject { BibleApi::Reference.new('Bad 4:1') }

      it 'is not valid' do
        expect(subject).to_not be_valid
      end
    end

    context 'given an poorly-formatted reference' do
      subject { BibleApi::Reference.new('foo12x34') }

      it 'is not valid' do
        expect(subject).to_not be_valid
      end
    end
  end

  describe '#ranges' do
    context 'given a single verse' do
      subject { BibleApi::Reference.new('John 3:16') }

      it 'returns a range with the same verse twice' do
        expect(subject.ranges).to eq([
          [{ book: 'JHN', chapter: 3, verse: 16 },
           { book: 'JHN', chapter: 3, verse: 16 }]
        ])
      end
    end

    context 'given a ranges of verses' do
      subject { BibleApi::Reference.new('1 John 5:11-12') }

      it 'returns a single range with first and last verse' do
        expect(subject.ranges).to eq([
          [{ book: '1JN', chapter: 5, verse: 11 },
           { book: '1JN', chapter: 5, verse: 12 }]
        ])
      end
    end

    context 'given a complicated multi-chapter, multi-verse reference' do
      subject { BibleApi::Reference.new('Romans 12:1,3-4 & 13:2-4,7-8') }

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
  end

end
