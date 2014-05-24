===========
Description
===========
Telephone Keypads commonly have both digits and characters on them.
This is to help with remembering & typing phone numbers,
like 1-800-PROGRAM rather than 1-800-776-4726.

Your goal is to mimic some of these features: 
given a series of digits from a telephone keypad, and a list of English words,
print the word or set of words that fits the starting pattern. 
You will be given the number of button-presses and digit, narrowing down the search-space.

========
Solution
========

pad = {
        '2' : 'abc',
        '3' : 'def',
        '4' : 'ghi',
        '5' : 'jkl',
        '6' : 'mno',
        '7' : 'pqrs',
        '8' : 'tuv',
        '9' : 'wxyz'}

def text_to_word(*numbers):
    nums = [n.split() for n in numbers]
    nums_flattened = [num for number in nums for num in number]

    word =''
    for num in nums_flattened:
        word +=pad[num[0]][len(num)-1]
    return word
    
def best_fit(*numbers):
    word_list =  [word for word in words if word.startswith(text_to_word(*numbers))]
    return word_list
