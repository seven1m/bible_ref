# -*- coding: utf-8 -*-
require_relative '../spec_helper'

describe BibleRef::LANGUAGES do

  describe '#has_single_chapter?' do

    context 'given the book of Philemon' do
      subject { BibleRef::LANGUAGES.fetch('eng').new }

      it 'has one chapter' do
        expect(subject.has_single_chapter?('Philemon 3-2')).to be_truthy
      end
    end

    context 'given the book of Matthew' do
      subject { BibleRef::LANGUAGES.fetch('eng').new }

      it 'does not have one chapter' do
        expect(subject.has_single_chapter?('Matthew 5:1-3')).to be_falsey
      end
    end

    context 'given the book of 2 John in Romanian' do
      subject { BibleRef::LANGUAGES.fetch('ron').new }

      it 'has one chapter' do
        expect(subject.has_single_chapter?('2 Ioan 1')).to be_truthy
      end
    end

    context 'given the book of John in Romanian' do
      subject { BibleRef::LANGUAGES.fetch('ron').new }

      it 'does not have one chapter' do
        expect(subject.has_single_chapter?('Iona')).to be_falsey
      end
    end

    context 'given the book of 3 John in Cherokee' do
      subject { BibleRef::LANGUAGES.fetch('chr').new }

      it 'has one chapter' do
        expect(subject.has_single_chapter?('ᏣᏂ ᏦᎢᏁ ᎤᏬᏪᎳᏅᎯ 4')).to be_truthy
      end
    end

    context 'given the book of John in Cherokee' do
      subject { BibleRef::LANGUAGES.fetch('chr').new }

      it 'does not have one chapter' do
        expect(subject.has_single_chapter?('ᎣᏍᏛ ᎧᏃᎮᏛ ᏣᏂ ᎤᏬᏪᎳᏅᎯ 5:1')).to be_falsey
      end
    end

    context 'given the book of Obadiah in Latin' do
      subject { BibleRef::LANGUAGES.fetch('lat').new }

      it 'has one chapter' do
        expect(subject.has_single_chapter?('Abdias 4')).to be_truthy
      end
    end

    context 'given the book of John in Latin' do
      subject { BibleRef::LANGUAGES.fetch('lat').new }

      it 'does not have one chapter' do
        expect(subject.has_single_chapter?('Joannes 5:1')).to be_falsey
      end
    end

    context 'given the book of Philemon in Portuguese' do
      subject { BibleRef::LANGUAGES.fetch('por').new }

      it 'has one chapter' do
        expect(subject.has_single_chapter?('Filemom 5-6')).to be_truthy
      end
    end

    context 'given the book of Mark in Latin' do
      subject { BibleRef::LANGUAGES.fetch('lat').new }

      it 'does not have one chapter' do
        expect(subject.has_single_chapter?('Marcos 4:1')).to be_falsey
      end
    end

    context 'given the book of Judith in English' do
      subject { BibleRef::LANGUAGES.fetch('eng').new }

      it 'does not have one chapter' do
        expect(subject.has_single_chapter?('Judith 4:1')).to be_falsey
      end
    end

    context 'given the book of Jude in English' do
      subject { BibleRef::LANGUAGES.fetch('eng').new }

      it 'has one chapter' do
        expect(subject.has_single_chapter?('Jude 1:1')).to be_truthy
      end
    end

    context 'given the book of Judges in Englsh' do
      subject { BibleRef::LANGUAGES.fetch('eng').new }

      it 'does not have one chapter' do
        expect(subject.has_single_chapter?('Judges 1:1')).to be_falsey
      end
    end

    context 'given the book of Filemonovi' do
      subject { BibleRef::LANGUAGES.fetch('cze').new }

      it 'has one chapter' do
        expect(subject.has_single_chapter?('Filemonovi 3-2')).to be_truthy
      end
    end

    context 'given the book of Revelation in Chinese' do
      subject { BibleRef::LANGUAGES.fetch('zh-tw').new }

      it 'does not have one chapter' do
        expect(subject.has_single_chapter?('啟示錄 1:1')).to be_falsey
      end
    end

    context 'given the book of 2 John in Chinese' do
      subject { BibleRef::LANGUAGES.fetch('zh-tw').new }

      it 'has one chapter' do
        expect(subject.has_single_chapter?('約翰貳書 1:1')).to be_truthy
      end
    end
  end

end
