def convert(number):
    converted = ""
    if number % 3 == 0:
        converted += "Pling"
    if number % 5 == 0:
        converted += "Plang"
    if number % 7 == 0:
        converted += "Plong"

    if not converted:
        return str(number)
    return converted
