file = open('p_e_13.txt')
a = []
for line in file:
    a.append(line)

b = [x.strip() for x in a]
c = [int(x) for x in b]
some = sum(c)
