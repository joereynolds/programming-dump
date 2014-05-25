"""
Using names.txt (right click and 'Save Link/Target As...'),
a 46K text file containing over five-thousand first names,
begin by sorting it into alphabetical order.
Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list
to obtain a name score.

For example, when the list is sorted into alphabetical order,
COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
So, COLIN would obtain a score of 938 × 53 = 49714.
What is the total of all the name scores in the file?
"""

file = open('names.txt')
names = [line.replace('"','').split(',') for line in file]
quick = sorted(names[0][:])

def alpha_value(iterable):
    alpha = [[(ord(iterable[j][i])-64) for i in range (len(iterable[j]))]for j in range(len(iterable))]
    values = [sum(x) for x in alpha ]
    finals = [values[i-1]*i for i in range(1,len(iterable)+1)]
    return finals

a = alpha_value(quick)
print (sum(a))
