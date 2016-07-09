"""Inspired by the mostly adept guide to functional programming"""

def compose(f, g):
    return lambda x: f(g(x))

def to_upper(x):
    return x.upper()
    
def exclaim(x):
    return x + '!'

def reverse(x):
    return x[::-1]

shout = compose(to_upper, exclaim)
angry_reverse = compose(reverse, exclaim)
extra_angry = compose(exclaim, exclaim)

shout('hello, world') # HELLO, WORLD!
angry_reverse('I am exclaiming') # !gnimialcxe ma I
extra_angry('no') # no!!


if __name__ == '__main__':
    print(shout('hello, world'))
    print(angry_reverse('I am exclaiming'))
    print(extra_angry('no'))
