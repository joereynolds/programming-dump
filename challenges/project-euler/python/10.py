def gen_primes(limit):
    """generates limit of prime numbers"""

    primes = [True] * limit
    primes[0] = False
    primes[1] = False
    
    for i, isprime in enumerate(primes):
        if isprime:
            yield i
            for j in range(i*i, limit, i):
                primes[j] = False
    return primes


n = 2000000
primes = list(gen_primes(n))
print(sum(primes))
