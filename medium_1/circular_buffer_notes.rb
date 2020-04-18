# circular_buffer_notes.rb

# Understanding:
#   - Circular Buffer/Ring Buffer
#   - Single fixed buffer
#     > As if connected end-to-end
#   - Starts empty
#     > Pre-defined length
#     > Starting position doesn't matter
#     > Elements added one 'after' another, sequentially
#     > Elements removed oldest to newest
#       + From opposite end of addition point
#   - When full
#     > Alert thrown upon attempt to add
#     > Forced write
#       + Overwrites oldest elements
#       + These elements added become newest

# Input
#   - `CircularBuffer::new` takes an integer
#     > Represents the buffer length
#   - `CircularBuffer#read`
#     > Removes an element from the buffer
#     > Oldest
#   - `CircularBuffer#write`
#     > Adds an element to the buffer
#       + Two adding conditions
#         = Buffer empty
#         = Buffer already has objects but is not full
#     > Throws an error if the buffer is full
#   - `CircularBuffer#write!`
#     > Adds an element to the buffer
#     > Overwrites oldest element if buffer is full

# Approach:
#   - Data Structure:
#     + Array
#     + Buffer Objects
#       = Class with object instance variable
#       = Timestamp
#   - Instantiate buffer by the length given
#     + Array
#     + New Buffer objects
#   - Write
#     > Throw an error if the buffer is full
#     > The buffer will need [] and []= methods
#     > When empty add at index random index
#       + Separate method
#       + Selects a random index from the buffers length
#       + Adds new BufferObject with input
#     > When other objects, add after newest object
#      + Find index of last empty object (rindex)
#      + Add new BufferObject at found index
#        = New object instantiated with input
#   - Read
#     > Throw an error if the buffer is empty
#     > 
#   - Write!
#     > If the buffer is full, read an object and discard it
#     > Add an object at the first empty index
