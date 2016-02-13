#very inefficient!
for i in range(1,1000):
    for j in range(1, 1000):
        a_squared = i * i
        b_squared = j * j
        for k in range(1,1000):
            c_squared = k * k
            if a_squared + b_squared == c_squared:
                if i + j + k == 1000:
                    print('answer is :', i*j*k)
        
