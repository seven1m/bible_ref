require 'parslet'

module BibleApi
  class Parser < Parslet::Parser
    rule(:refs) do
      (
        (ref_range | ref) >>
        (
          separator >>
          (ref_range | verse_range | ref | verse)
        ).repeat
      ).as(:refs)
    end

    rule(:ref_range)   { (ref.as(:from) >> str("-") >> (ref | verse).as(:to)).as(:range) }
    rule(:verse_range) { (verse.as(:from) >> str("-") >> verse.as(:to)).as(:range) }

    rule(:ref)         { (chapter >> str(":") >> verse) }

    rule(:chapters)    { (chapter >> (match("[-,]") >> chapter).repeat).as(:refs) }
    rule(:chapter)     { num.as(:chapter) }
    rule(:verse)       { num.as(:verse) }

    rule(:word)        { (match("[0-9]").maybe >> match("[A-Za-z ]").repeat(1)).as(:word) }
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
