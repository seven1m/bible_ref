# BibleRef

Turn "John 3:16" into:

```ruby
{
  book: 'John',
  refs: {
    chapter: 3,
    verse: 16,
  }
}
```

...and turn "Romans 12:1-2,4,13:7-8" into:

```ruby
{
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
}
```

## Copyright

Copyright [Tim Morgan](http://timmorgan.org). See LICENSE.
