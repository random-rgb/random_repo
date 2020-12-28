# run with python3
import itertools

key = open("bamba_secret_key.key", "rb").read(6)

message = input("Enter the bamba recipy: ")

open("bamba_recipy.enc", "wb").write((bytearray([ord(a) ^ b for a, b in zip(message, itertools.cycle(key))])))
