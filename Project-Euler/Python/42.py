"""
The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its alphabetical position
and adding these values we form a word value. 
For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. 
If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), 
a 16K text file containing nearly two-thousand common English words, how many are triangle words?
"""

file = open('words.txt')
a = [line.strip().replace('"','').split(',') for line in file]

            
def triangle(n):
    t = n*(n+1)//2    
    return t

def get_word_value(word):
    word_value = 0
    for letter in word:
        word_value += ord(letter)-64
    return word_value

TRIANGULARS = [triangle(x) for x in range(1000)]

def is_triangular_word(word):

    if get_word_value(word) in TRIANGULARS:
        return True

triangular_word_count = 0

for word in a[0]:
    if is_triangular_word(word):
        triangular_word_count+=1
