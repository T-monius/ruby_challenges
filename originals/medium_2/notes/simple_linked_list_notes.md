# Understanding
__Linked List__: fundamental data structure in cs

Used in the implementation of other data structures

*simplest linked list*: a singly linked list

Used in __LIFO__ stacks
Represents sequences
push-down stacks

### methods

#### `Element` class
- `new`
  + Can take a numeric argument
  + An element that's not the first in the list should be initialized with
    a reference to it's predecessor as the second argument


#### `Element` instance
- `datum`
  + Return the value of an element
- `next`
  + Default returns `nil`
  + Returns the value in `next` which may be `nil` or another `Element` instance
- `tail?`
  + Returns `true` if the element is the oldest in the list
  + The 'oldest' element in the 'push down stack' is the first one entered
  + The oldest element in the list will have a `nil` in the `next` instance variable

#### `SimpleLinkedList` class
- `new`
  + A linked list can be instantiated without an argument
- `from_a`
  + Takes an array and turns it into a linked list

#### `SimpleLinkedList` instance
- `size`
- `empty?`
- `push`
- `peek`
  + Returns the value of the most recently added element in the list
- `head`
  + Returns the most newly added element in the list
- `pop`
  + Removes the most recently added item
- `to_a`
  + Returns an array of all of the values of the linked list with the first element input as the first item in the array
- 'reverse'
  + Reverses the order of the linked list
    * The oldest item is now the newest
    * The newest item is the oldest in the new list

## Input
- range `(1..10)`

## Task
 
## Output


## Implementation

### `Element` class
- `next` and `datum` accessors
- Constructor assigns the first argument as the `datum`
- Assign `next` to second argument or `nil`

### `SimpleLinkedList` class
- The class can piggy back off of the `Array` class
  + Initialize the list with an empty array instance variable
  + Methods `empty?`, `push`, `pop` can be attained from the `Array` collaborator
- `peek`
  + Return the value of the element at index `0`
- `head`
  + Return the element at index `0`
- `from_a`
  + Instantiate a new linked list object
  + If the input array is empty then return an empty list
  + Iterate the elements of the input array and make them `Element` class objects
    * The first element's `next` element is nil
    * Instantiate a variable to nil to pass in for that object
    * The second element's `next` element is the previous element in the list
- `to_a`
  + Since the first element of the 'linked list' is stored as the last element of the internal `elements_array` instance variable, it must be returned in reverse order of that in which the elements are stored.
- `reverse`
  + Instantiate a new linked list
  + Iterate over the current list in reverse order and push the value of its elements to the new linked list at each iteration


