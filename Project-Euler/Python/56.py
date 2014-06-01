"""
#NOTE: EXPONENTS DO NOT FORMAT CORRECTLY IN GITHUB.
A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost unimaginably large: 
one followed by two-hundred zeros. 
Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, ab, where a, b < 100, what is the maximum digital sum?


"""

def max_digit_sum():
    max_sum = 0
    for i in range(100):
        for j in range(100):
            if split_and_add(i**j) > max_sum:
                max_sum = split_and_add(i**j)
    return max_sum

def split_and_add(number):
    number = str(number)

    total = 0 
    for num in number:
        total += int(num)
    return total
