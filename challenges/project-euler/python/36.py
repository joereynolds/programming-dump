def both_palindromes(n):
    """Returns true if both the binary and int
    version of a number are palindromic"""
    clean_bin = str(bin(n))[2:]
    if str(n) == str(n)[::-1] and clean_bin == clean_bin[::-1]:
        return True

print(sum([x for x in range(1000000) if both_palindromes(n)]))
