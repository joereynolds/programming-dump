===========
Description
===========

In graph theory, an adjacency matrix is a data structure that can represent the edges between nodes for a graph
in an N x N matrix.
The basic idea is that an edge exists between the elements of a row and column if
the entry at that point is set to a valid value. 
This data structure can also represent either a directed graph or an undirected graph , 
since you can read the rows as being "source" nodes, and columns as being the "destination".

Your goal is to write a program that takes in a list of edge-node relationships
and print a directed adjacency matrix for it. 
Our convention will follow that rows point to columns. 

Note: I will be following these conventions for the graphs.
http://www.personal.psu.edu/djh300/cyhs/discrete/unit-c-graph-theory/13-06-adj-matrix.pdf


========
Solution
========

"""An adjacency list is given as a list of lists.
take for example this adjacency list:

adjacent_list = [[0,1],
                 [1,2],    
                 [2,4],    
                 [3,4],    
                 [0,3]]   

This is then fed into a n*m matrix and outputted with
the function adjacency_matrix()
"""

def create_matrix(columns,rows):
    """creates a col x row matrix"""
    matrices = [[0 for y in range(columns)]for x in range(rows)]
    return matrices

def adjacency_matrix(adjacency_list,matrix):

    for item in adjacency_list:
        matrix[item[0]][item[1]] = 1
    return matrix
