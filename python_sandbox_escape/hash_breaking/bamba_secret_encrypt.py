# run with python3
import itertools

KEY_LENGTH = 6

key = open("bamba_secret_key.key", "rb").read(KEY_LENGTH)

message = input("Enter the bamba recipy: ")

open("bamba_recipy.enc", "wb").write((bytearray([ord(a) ^ b for a, b in zip(message, itertools.cycle(key))])))
