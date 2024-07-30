# Anagrams

## Problem

_Understanding:_
  - An anagram is a rearrangement of the letters in another word.
  - Sorted arrays of the characters in words can be compared; they are anagrams of one another if comparison is true.

Input
  - The test suite instantiates an `Anagram` object
    + Instantiated w/ a single word
    + Has a `match` instance method that takes an array
Output
  - `match` returns an array
    + Anagrams of `Anagram` object found in the list
    + Case insensitive
    + Does not match if other word is the original word.

Task
  - Select words in collection argument that are anagrams of the `Anagram` instance

## Examples/Test Cases

```ruby
target = 'ant'
target_sorted = ['a', 'n', 't']
mathes = ['tan']
words = ['tan', 'stand', 'at']
#          ^
word_sorted = ['a', 'n', 't']
#=> ['tan']
```

## Data Structures

- Arrays

## Algorithm

1. Define `Anagram` class
  - `initialize` takes `target` parameter
  - Stores `target` as an instance variable w/ setter
  - `attr_accessor :target`?
1. Define `matches` instance method
  - `words` parameter
  - Instantiate `sorted_target` variable
    - Get `chars` of `target`
    - Sort chars
  - Select matches from `words` (i.e. invoce `select` on input)
    - Assign return value to intermediary var `found`?
    - Sort word at iteration after accessing chars
    - Compare to `sorted_target`
    - Return result of comparison
  - Return intermediary select var or direct return from `select`
