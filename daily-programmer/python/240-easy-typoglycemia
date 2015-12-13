import random


def create_typos(user_input):
    words = user_input.split()   
    typod_words = []

    new_word = ""
    for word in words:
        new_word += word[0]
        new_word += shuffle_word(word)
        new_word += word[-1]
        typod_words.append(new_word)
        new_word = ""
    return ' '.join(typod_words)

def shuffle_word(word):
    """Because random.shuffle isn't good enough apparently"""
    word = list(word[1:-1])
    random.shuffle(word)
    shuffled = ''.join(word)
    return shuffled

def main():
    user_input = input('Enter a sentence\n')
    print(create_typos(user_input))

main()
