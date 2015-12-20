class CircularBuffer():

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
        self.buffer[self.buffer_end] = item
        self.buffer_end += 1

        # If the we've reached the end of our buffer,
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

        if self.buffer_start == len(self.buffer) :
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


def show_details(cbuffer):
    """Shows the start and end points of a buffer.
    useful for testing only"""
    print('-'*40)
    print(cbuffer)
    print('Start : ',cbuffer.buffer_start)
    print('End : ',cbuffer.buffer_end)

def test():
    """A test against wikipedia's implementation.
    https://en.wikipedia.org/wiki/Circular_buffer"""
    c = CircularBuffer(7)
    show_details(c)

    c.add_item(1)
    show_details(c)

    c.add_items(2,3)
    show_details(c)

    c.remove_item()
    c.remove_item()
    show_details(c)

    c.add_items(4,5,6,7,8,9)
    show_details(c)

    c.add_items('A','B')
    show_details(c)

    c.remove_item()
    c.remove_item()
    show_details(c)

if __name__ == '__main__':
    test()    
