# BibleRef

This small Rubygem does its best at taking a user-input string like "john 3:16" and turning it into something useful
for querying a database (this is how we use it in [bible_api](https://github.com/seven1m/bible_api)).

## Usage

```ruby
ref = BibleRef::Reference.new('jn 3:16')
# #<BibleRef::Reference:0x000001020f7000 @reference="jn 3:16", @details={:book=>"jn", :refs=>{:chapter=>3, :verse=>16}}>

ref.valid?
# true

ref.book.id
# "JHN"

ref.normalize
# "John 3:16"
```

## Ranges

Call `#ranges` to get from/to pairs of verses.

```ruby
BibleRef::Reference.new('john 3:16').ranges
# [
#   [{ book: 'JHN', chapter: 3, verse: 16 },
#    { book: 'JHN', chapter: 3, verse: 16 }]
# ]

BibleRef::Reference.new('Romans 12:1,3-4 & 13:2-4,7-8').ranges
# [
#   [{ book: 'ROM', chapter: 12, verse: 1 },
#    { book: 'ROM', chapter: 12, verse: 1 }],
#   [{ book: 'ROM', chapter: 12, verse: 3 },
#    { book: 'ROM', chapter: 12, verse: 4 }],
#   [{ book: 'ROM', chapter: 13, verse: 2 },
#    { book: 'ROM', chapter: 13, verse: 4 }],
#   [{ book: 'ROM', chapter: 13, verse: 7 },
#    { book: 'ROM', chapter: 13, verse: 8 }]
# ]
```

You can then take this and turn it into a few small SQL queries like this:

```ruby
verses = ranges.map do |from_ref, to_ref|
  first = DB['select id from verses where book = :book and chapter = :chapter and verse = :verse limit 1', from_ref].first
  last  = DB['select id from verses where book = :book and chapter = :chapter and verse = :verse limit 1', to_ref].first
  DB['select * from verses where id between ? and ?', first['id'], last['id']]
end
```

## Copyright

Copyright [Tim Morgan](http://timmorgan.org). Licensed MIT.
