def mult(iterable):
    """Multiplies all elements of a list together
    [1,2,3,4] would be 1*2*3*4"""
    total = 1
    for number in iterable:
        total *= number
    return total

file = open("numbers.txt")
numbers = [line.strip() for line in file]

actual_numbers = ""

for i in range(len(numbers)):
    actual_numbers += numbers[i]

products = []
for j in range(len(actual_numbers)-100):
    products.append(list(actual_numbers[j:j+13]))

new_prod = []
for _list in products:
    new_prod_sequence = []
    for number in _list:
        new_prod_sequence.append(int(number))
    new_prod.append(new_prod_sequence)

maxi = 0
for __list in new_prod:
    print(__list)
    print(mult(__list))
    if mult(__list) > maxi:
        maxi = mult(__list)
