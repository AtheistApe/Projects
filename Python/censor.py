def censor1(text, word):
    words = text.split()
    censored = []
    for myword in words:
        if myword == word:
            censored  += ['*' * len(myword)]
        else:
            censored += [myword]

    return ' '.join(censored)
    
def censor2(text, word):
    words = text.split()
    for n in range(len(words)):
        if words[n] == word:
            words[n] = '*' * len(words[n])
        else:
            pass

    return ' '.join(words)
    
print censor1("This fng stuff is fng fng stupid man", "fng")
print censor2("This fng stuff is fng fng stupid", "fng")
