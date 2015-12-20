#See https://en.wikipedia.org/wiki/Heap_(data_structure) for implementation


heap = [
    100, #root
    19,  #child
    36,  #child
    17,  #child child
    3,   #child child
    25,  #child child
    1,   #child child
    2,   #child child child
    7    #child child child
]


class Heap():
    
    def __init__(self, values):
        self.heap = values
        
    def get_root(self):
        return self.heap[0]
        
    def get_children(self, index):
        """Gets the children of a value at @index
        We're using an array to contain our heap.
        Look it up in Wikipedia, it's weird.
        """
        return (
            self.heap[(index * 2) +1], 
            self.heap[(index * 2) +2] 
                )
        
    def max_heapify(self):
        left  = index * 2 + 1
        right = index * 2 + 2
        
        
        pass
    
    def h_sort(self):
        """Your standard heap sort"""
        pass
        
h = Heap(heap)
