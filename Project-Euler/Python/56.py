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
