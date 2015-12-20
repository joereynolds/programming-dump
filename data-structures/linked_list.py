"""An implementation of a linked list...in python"""

class Node():
    """The meat and potatoes of our
    LinkedList."""

    def __init__(self, value):
        self.value = value
        self.next = None


class LinkedList():
    """A collection of Node's"""

    def __init__(self):
        """
        self.head = The top of our LinkedList
        self.tail = The end of our LinkedList
        self.current_node = Our current node, used for linking
                            our nodes together
        """
        self.head = None
        self.tail = None
        self.current_node = None

    def add_node(self, value):
        """Add a Node to our linked list"""
        node = Node(value)

        if self.head is None:
            self.head = node
        self.tail = node     

        if self.current_node is None:
            self.current_node = node

        self.current_node.next = node
        self.current_node = node

    def add_nodes(self, *values):
        """Add multiple nodes to a list at once"""
        for value in values:
            self.add_node(value)

    def remove_node(self, value):
        """Removes the first node it sees from the
        LinkedList that has @value"""
        node = self.head

        while node:
            if self.head.value == value:
                self.head = self.head.next
                return
            if node.next.value == value:
                node.next = node.next.next
                return
            node = node.next    

    def print_list(self):
        """Prints a linked list"""
        node = self.head

        string = '['
        while node:
            if node.next:
                string += str(node.value) + ' -> '
            else : 
                string += str(node.value)
            node = node.next
        string += ']'
        return string

    def __repr__(self):
        return self.print_list()
