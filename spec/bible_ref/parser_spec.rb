# -*- coding: utf-8 -*-
require_relative '../spec_helper'

describe BibleRef::Parser do
  let(:transform) { BibleRef::ParserTransform.new }

  def parse(str)
    parsed = subject.parse(str)
    transform.apply(parsed)
  end

  it 'parses a single verse' do
    expect(parse('John 3:16')).to eq(
      book: 'John',
      refs: {
        chapter: 3,
        verse: 16
      }
    )
  end

  it 'parses two verses separated with hyphen' do
    expect(parse('1 John 5:11-12')).to eq(
      book: '1 John',
      refs: {
        range: {
          from: { chapter: 5, verse: 11 },
          to:   {             verse: 12 }
        }
      }
    )
  end

  it 'parses a verse followed by a range separated with comma' do
    expect(parse('1 John 5:11,14-15')).to eq(
      book: '1 John',
      refs: [
        { chapter: 5, verse: 11 },
        {
          range: {
            from: { verse: 14 },
            to:   { verse: 15 }
          }
        }
      ]
    )
  end

  it 'parses two chapter/verse pairs separated with hyphen' do
    expect(parse('Romans 7:25-8:1')).to eq(
      book: 'Romans',
      refs: {
        range: {
          from: { chapter: 7, verse: 25 },
          to:   { chapter: 8, verse: 1  }
        }
      }
    )
  end

  it 'parses two verses separated with comma' do
    expect(parse('Romans 12:1,2')).to eq(
      book: 'Romans',
      refs: [
        { chapter: 12, verse: 1 },
        {              verse: 2 }
      ]
    )
  end

  it 'parses two verses separated with ampersand' do
    expect(parse('Romans 12:1 & 2')).to eq(
      book: 'Romans',
      refs: [
        { chapter: 12, verse: 1 },
        {              verse: 2 }
      ]
    )
  end

  it 'parses hyphen and comma together' do
    expect(parse('Romans 12:1-2,4,13:7-8')).to eq(
      book: 'Romans',
      refs: [
        {
          range: {
            from: { chapter: 12, verse: 1 },
            to:   {              verse: 2 }
          }
        },
        { verse: 4 },
        {
          range: {
            from: { chapter: 13, verse: 7 },
            to:   {              verse: 8 }
          }
        }
      ]
    )
  end

  it 'parses a whole chapter' do
    expect(parse('Romans 12')).to eq(
      book: 'Romans',
      refs: { chapter: 12 }
    )
  end

  it 'parses two chapters separated with comma' do
    expect(parse('Romans 12,13')).to eq(
      book: 'Romans',
      refs: [
        { chapter: 12 },
        { chapter: 13 }
      ]
    )
  end

  it 'parses multiple chapters separated with hyphen' do
    expect(parse('Romans 12-14')).to eq(
      book: 'Romans',
      refs: [
        { chapter: 12 },
        { chapter: 14 }
      ]
    )
  end

  it 'parses another language' do
    expect(parse('João 3:16')).to eq(
      book: 'João',
      refs: {
        chapter: 3,
        verse: 16
      }
    )
  end
end
