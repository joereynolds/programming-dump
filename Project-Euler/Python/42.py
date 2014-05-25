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
