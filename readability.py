##This website takes a passage and determines the suggested grade level of the reader

from cs50 import get_string

passage = get_string("Text: ")

letters = 0

for i in range(len(passage)):
    if passage[i].isalpha():
        letters += 1

words = 1

for j in range(len(passage)):
    if passage[j] == ' ':
        words += 1

sentences = 0

for k in range(len(passage)):
    if passage[k] in ('.', '!', '?'):
        sentences += 1

L = 100 * (letters / words)

S = 100 * (sentences / words)

grade = round(0.0588 * L - 0.296 * S - 15.8)

if grade < 1:
    print("Before Grade 1")
elif grade >= 16:
    print("Grade 16+")
else:
    print(f"Grade {grade}")
