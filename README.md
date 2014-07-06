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

## Copyright

Copyright [Tim Morgan](http://timmorgan.org). See LICENSE.
