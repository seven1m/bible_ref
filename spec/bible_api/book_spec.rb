require_relative '../../lib/bible_api/book'

describe BibleApi::Book do

  describe '#id' do
    context 'given the full book name' do
      subject { BibleApi::Book.new('John') }

      it 'returns the USFX identifier' do
        expect(subject.id).to eq('JHN')
      end
    end

    context 'given an abbreviated book' do
      subject { BibleApi::Book.new('Ez') }

      it 'returns the USFX identifier' do
        expect(subject.id).to eq('EZR')
      end
    end

    context 'given a book not in the canon' do
      subject { BibleApi::Book.new('3 Maccabees', :protestant) }

      it 'returns nil' do
        expect(subject.id).to be_nil
      end
    end
  end

end
