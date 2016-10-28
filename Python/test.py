a, b, c = (1, 2, 3)

print(a, b, c)


def test():
    global a, b, c
    print(a)
    print(b)
    print(c)    # (A)
    c += 1       # (B)

test()
