import itertools
import binascii

key = [
	0x85,
	0x86,
	0x87,
	0x88,
]

message = "hello my name is avram avram"

print ''.join([binascii.unhexlify("{:02x}".format(ord(a[0]) ^ a[1])) for a in zip(message, itertools.cycle(key))])
