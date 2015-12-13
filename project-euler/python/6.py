"""
The sum of the squares of the first ten natural numbers is;
12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is;
(1 + 2 + ... + 10)2 = 552 = 3025
The difference between the sum of the squares of the first ten natural numbers
and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers
and the square of the sum.
"""

import math

def sum_square_diff(n):

    sum_of_squares = sum([x**2 for x in range(n+1)])
    natural_square_sum = (sum([x for x in range(n+1)]))**2

    return natural_square_sum - sum_of_squares
