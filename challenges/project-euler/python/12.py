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
    """Returns the triangle number n"""
    t = 0
    for i in range(1, n+1):
        t += i
    return t

def triangle_numbers(n):
    """Generate the first n triangle numbers"""
    return (triangle_number(tri) for tri in range(1, n+1))

for num in triangle_numbers(20000):
    if len(factors_new(num)) > 500:
        print(num)
        break
