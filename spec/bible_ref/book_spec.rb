require_relative '../../lib/bible_ref/book'

describe BibleRef::Book do

  describe '#id' do
    context 'given the full book name' do
      subject { BibleRef::Book.new('John') }

      it 'returns the USFX identifier' do
        expect(subject.id).to eq('JHN')
      end
    end

    context 'given an abbreviated book' do
      subject { BibleRef::Book.new('Ez') }

      it 'returns the USFX identifier' do
        expect(subject.id).to eq('EZR')
      end
    end

    context 'given a book not in the canon' do
      subject { BibleRef::Book.new('3 Maccabees', :protestant) }

      it 'returns nil' do
        expect(subject.id).to be_nil
      end
    end
  end

  describe '#formatted' do
    subject { BibleRef::Book.new('1 Jn') }

    it 'returns the formatted book name' do
      expect(subject.formatted).to eq('1 John')
    end
  end

end
