# BibleRef

Turn "John 3:16" into:

```ruby
[
  [{ book: 'JHN', chapter: 3, verse: 16 },
   { book: 'JHN', chapter: 3, verse: 16 }]
]
```

...and turn "Romans 12:1,3-4 & 13:2-4,7-8" into:

```ruby
[
  [{ book: 'ROM', chapter: 12, verse: 1 },
   { book: 'ROM', chapter: 12, verse: 1 }],
  [{ book: 'ROM', chapter: 12, verse: 3 },
   { book: 'ROM', chapter: 12, verse: 4 }],
  [{ book: 'ROM', chapter: 13, verse: 2 },
   { book: 'ROM', chapter: 13, verse: 4 }],
  [{ book: 'ROM', chapter: 13, verse: 7 },
   { book: 'ROM', chapter: 13, verse: 8 }]
]
```

(We return from/to pairs for every range so to make querying a SQL database easy peasy.)

See [the specs](https://github.com/seven1m/bible_ref/blob/master/spec/bible_ref/reference_spec.rb) for more examples.

## Copyright

Copyright [Tim Morgan](http://timmorgan.org). See LICENSE.
