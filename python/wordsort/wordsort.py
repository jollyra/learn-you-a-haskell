def wordsort(words, best_letters):
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    alphabet_v2 = best_letters
    for letter in alphabet:
        if letter not in best_letters:
            alphabet_v2 += letter
    print alphabet_v2
    sorted_words = list()
    # There should be at least one element in the sorted array.
    sorted_words.append(words.pop())
    # Insertion sort
    for i in words:
        for j in sorted_words:
            if lessThan(i, j, alphabet_v2):
                sorted_words.insert(sorted_words.index(j), i)
    return sorted_words


# Returns True if i is less than j, and false otherwise.
def lessThan(i, j, best_letters):
    print i, j
    count = 0
    min_len = min(len(i), len(j))
    while count < min_len:
        if best_letters.index(i[count]) < best_letters.index(j[count]):
            return True
        elif best_letters.index(i[count]) > best_letters.index(j[count]):
            return False
        else:
            count += 1


if __name__ == "__main__":
    words = ["amber", "azure", "horse", "zebra", "buzz", "bazaar", "bar"]
    best_letters = "zh"
    print wordsort(words, best_letters)
