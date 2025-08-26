require 'parslet'

module BibleRef
  class Parser < Parslet::Parser
    rule(:refs) do
      (
        chapter_range | chapter_and_verse_range
      ).as(:refs)
    end

    rule(:chapter_range) do
      chapter >> (separator >> chapter).repeat
    end

    rule(:chapter_and_verse_range) do
      (ref_range | ref | chapter) >>
      (
        separator >>
        (ref_range | verse_range | ref | verse)
      ).repeat
    end

    rule(:ref_range)   { (ref.as(:from) >> str("-") >> (ref | verse).as(:to)).as(:range) }
    rule(:verse_range) { (verse.as(:from) >> str("-") >> verse.as(:to)).as(:range) }

    rule(:ref)         { chapter >> str(":") >> verse }

    rule(:chapters)    { (chapter >> (match("[-,]") >> chapter).repeat).as(:refs) }
    rule(:chapter)     { num.as(:chapter) }
    rule(:verse)       { num.as(:verse) }

    rule(:word)        { (match("[1234]").maybe >> match("[^0-9]").repeat(1)).as(:word) }
    rule(:separator)   { (str(",") >> space.maybe) | (space.maybe >> str("&") >> space.maybe) }
    rule(:num)         { match("[0-9]").repeat(1).as(:num) }
    rule(:space)       { str(" ").repeat(1) }

    rule(:reference)   { word.as(:book) >> space.maybe >> (refs | chapters) }

    root(:reference)
  end

  class ParserTransform < Parslet::Transform
    rule(word: simple(:w)) { w.to_s.strip }

    rule(num: simple(:n)) { n.to_i }
  end
end
