import random


consonants = [
    'b', 'c', 'd', 'f', 'g',
    'h', 'j', 'k', 'l', 'm',
    'n', 'p', 'q', 'r', 's',
    't', 'v', 'w', 'x', 'y',
    'z'
]
vowels = [
    'a', 'e',' i', 'o', 'u'
]

def make_word(user_input):
    word = ""

    for letter in user_input:
        letter = letter.lower()
        if letter == 'c':
            word += random.choice(consonants)
        elif letter == 'v':
            word += random.choice(vowels)
        elif letter.isspace():
            word += ' '
        else :
            print('Incorrect character passed. You must supply either a [c]onsonant, or a [vowel]\n')
    return word

def main():
    pattern = input('Enter your lexical pattern, c for consonant. v for vowel\n')
    print(make_word(pattern))

main()
