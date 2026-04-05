def main():
    numbers = list(map(int, input("Enter numbers separated by space: ").split()))

    if numbers == sorted(numbers):
        print("List is sorted")
    else:
        print("List is not sorted")

if __name__ == "__main__":
    main()