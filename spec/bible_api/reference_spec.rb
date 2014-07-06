require_relative '../../lib/bible_api/reference'

describe BibleApi::Reference do

  subject { BibleApi::Reference.new('John 3:16') }

  describe '#reference' do
    it 'returns the user-supplied reference' do
      expect(subject.reference).to eq('John 3:16')
    end
  end

  describe '#range' do
    context 'given a single verse' do
      subject { BibleApi::Reference.new('John 3:16') }

      it 'returns an array with the same verse twice' do
        expect(subject.range).to eq([
          { book: 'JHN', chapter: 3, verse: 16 },
          { book: 'JHN', chapter: 3, verse: 16 }
        ])
      end
    end

    context 'given a range of verses in a single chapter' do
      subject { BibleApi::Reference.new('1 John 5:11-12') }

      it 'returns an array with the same verse twice' do
        expect(subject.range).to eq([
          { book: '1JN', chapter: 5, verse: 11 },
          { book: '1JN', chapter: 5, verse: 12 }
        ])
      end
    end
  end

end
