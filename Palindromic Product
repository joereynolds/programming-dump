===========
Description
===========

A palindrome is a string of characters that are read the same way both ways (forward and backwards).
Given two range of integers (a_start, a_end and b_start, b_end), 
if at least one of the products between the two ranges is a palindrome, print the integer-pair.
For example, if the first range of integers is [90,99] and the second is [90,99],
there is at least one palindrome because 91 x 99 = 9009, which is read the same forward and backward.
Thus, "91, 99" should br printed.

========
Solution
========

def is_palindrome(number):

    if number[:] == number[::-1]:
        return True

def palindromic_product(a_start,a_end,b_start,b_end):
    for x in range(a_start,a_end):
        for y in range(b_start,b_end):
            number = str(x*y)
            if is_palindrome(number):
                print('X:',x,'Y:',y,'Product:',number)
  
