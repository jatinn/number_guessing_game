from random import randint

def main():
    secret_number = randint(1, 100)
    correct = False

    print "Guess the number!"
    while not correct:
        try:
            guess = int(raw_input("Please input your guess (1-100): "))
        except ValueError:
            print "Please input a number!"
            continue

        if guess < secret_number:
            print "Too small!"
        elif guess > secret_number:
            print "Too big!"
        else:
            print "You win!"
            correct = True

if __name__ == '__main__':
    main()
