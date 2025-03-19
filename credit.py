## this code takes a credit card number and determines whether the card is AMEX, MasterCard, Visa, or invalid! 

from cs50 import get_int

while True:
    number = get_int("Number ")
    if number > 0:
        break

copy_number = number
luhnsum = 0

while copy_number > 0:
    space = copy_number % 10
    luhnsum += space

    copy_number //= 10

    digit = copy_number % 10

    if digit * 2 >= 10:
        sum = int(str(digit * 2)[0]) + int(str(digit * 2)[1])
        luhnsum += sum
    else:
        luhnsum += digit * 2

    copy_number //= 10

if int(str(luhnsum)[-1]) != 0:
    print("INVALID")

elif len(str(number)) == 15 and (int(str(number)[0:2]) == 34 or int(str(number)[0:2]) == 37):
    print("AMEX")
elif len(str(number)) == 16 and (int(str(number)[0]) == 5 and 1 <= int(str(number)[1]) <= 5):
    print("MASTERCARD")
elif (len(str(number)) == 13 or len(str(number)) == 16) and int(str(number)[0]) == 4:
    print("VISA")
else:
    print("INVALID")
