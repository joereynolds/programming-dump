import math

def factors(n):
    """Returns an array of factors for n."""
    factors = []
    i = 2
    while(i < math.sqrt(n)):
        if n%i == 0:
            factors.append(i)
            if i != (n/i):
                factors.append(n/i)
        i += 1

    factors.append(1)
    factors.append(n)
    return factors

def triangle_number(n):
    return n*(n+1)//2

def triangle_numbers(n):
    """Generate the first n triangle numbers"""
    return (triangle_number_new(tri) for tri in range(1, n+1))

for num in triangle_numbers(20000):
    if len(factors(num)) > 500:
        print(num)
        break
