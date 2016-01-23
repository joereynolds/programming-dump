"""
This module contains an implementation of a fixed size Circular Buffer.
It is created to the specification given on wikipedia. This can be
seen here: https://en.wikipedia.org/wiki/Circular_buffer
"""

import unittest

class CircularBuffer():
    """
    @BUFFER_START = The start index of the buffer.
                    Note that this is completely
                    Arbitrary and can be set to
                    any value not exceeding
                    self.size
    """

    BUFFER_START = 2

    def __init__(self, size):
        """
        @self.size = The size of the buffer
        @self.buffer = The buffer itself and the data it contains
        @self.buffer_start = The starting index of our buffer
        @self.buffer_end = The end index of our buffer
        """
        self.size = size
        self.buffer = [None] * self.size
        self.buffer_start = CircularBuffer.BUFFER_START
        self.buffer_end = CircularBuffer.BUFFER_START

    def add_item(self, item):
        """Adds an item to our buffer and takes
        care of all indexing work"""
        
        #We need to make sure we check if we're overwriting
        #a piece of data in the buffer. If we are, set the buffer
        #start index accordinagly
        if self.buffer[self.buffer_end] is not None:
            self.buffer_start += 1

        self.buffer[self.buffer_end] = item
        self.buffer_end += 1

        # If we've reached the end of our buffer,
        # reset the 'end' to the beginning
        if self.buffer_end == len(self.buffer):
            self.buffer_end = 0

    def add_items(self, *items):
        """A wrapper to call add_items N times"""
        for item in items:
            self.add_item(item)

    def remove_item(self):
        """Removes an item from our buffer
        and takes care of indexing"""
        self.buffer[self.buffer_start] = None

        if self.buffer_start == len(self.buffer) - 1:
            self.buffer_start = 0
        else : self.buffer_start += 1    

    def destroy(self):
        """Wipe our buffer and start again"""
        self.buffer = [None] * self.size 
        self.buffer_start = CircularBuffer.BUFFER_START
        self.buffer_end = CircularBuffer.BUFFER_START

    def __repr__(self):
        """Show a more friendly version of the
        buffer by default"""
        return str(self.buffer)


def test():
    """A test against wikipedia's implementation.
    https://en.wikipedia.org/wiki/Circular_buffer"""

    print('Running tests...')
    tester = unittest.TestCase()

    c = CircularBuffer(7)
    tester.assertEqual(c.buffer, [None, None, None, None, None, None, None])
    tester.assertEqual(c.buffer_start, 2)
    tester.assertEqual(c.buffer_end, 2)

    c.add_item(1)
    tester.assertEqual(c.buffer, [None, None, 1, None, None, None, None])
    tester.assertEqual(c.buffer_end, 3)

    c.add_items(2,3)
    tester.assertEqual(c.buffer, [None, None, 1, 2, 3, None, None])

    c.remove_item()
    tester.assertEqual(c.buffer, [None, None, None, 2, 3, None, None])

    c.remove_item()
    tester.assertEqual(c.buffer, [None, None, None, None, 3, None, None])

    c.add_items(4,5,6,7,8,9)
    tester.assertEqual(c.buffer, [6, 7, 8, 9, 3, 4, 5])

    c.add_items('A','B')
    tester.assertEqual(c.buffer, [6, 7, 8, 9, 'A', 'B', 5])

    c.remove_item()
    tester.assertEqual(c.buffer, [6, 7, 8, 9, 'A', 'B', None])

    c.remove_item()
    tester.assertEqual(c.buffer, [None, 7, 8, 9, 'A', 'B', None])

#currently unused. Switch to this when possible
class TestCircularBuffer(unittest.TestCase):

    def __init__(self):
        self.cBuffer = CircularBuffer(7)

    def test_buffer_start(self):
        pass

    def test_add_item(self):
        pass

    def test_add_items(self):
        pass

    def test_remove_item(self):
        pass

    def test_destroy(self):
        pass

if __name__ == '__main__':
    test()    
