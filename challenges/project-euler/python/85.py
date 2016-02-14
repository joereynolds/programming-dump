def get_rect_count(m, n):
    """Returns the amount of rectangles within a rectangle."""
    return (m**2 + m) * (n**2 + n) / 4

def get_closest(n, numbers):
    """Returns the number that is closest to n from a list"""
    closest = 99999999999999
    for number in numbers:
        potential_closest = abs(number - n)
        if potential_closest < closest:
            closest = potential_closest

    #1st item = How far off we were from the target
    #2nd item = What our closest number was
    return (closest, n - closest)

possible_answers = []
debug = []
for m in range(1000):
    for n in range(1000):
        if get_rect_count(m, n) > 1999000 and get_rect_count(m, n) < 2000000:
            possible_answers.append(get_rect_count(m, n))
            debug.append((get_rect_count(m,n), m, n, m*n))

#had to manually scrape the answer...but still...
print(get_closest(2000000, possible_answers))
for bug in debug:
    print(bug)

