import itertools
import binascii

key = [
	0x11,
	0x22,
	0x33,
	0x88,
	0x75,
	0x64,
	0x23,
	0x49,
]

message = "hello my name is moses and i like pizza"

print ''.join([binascii.unhexlify("{:02x}".format(ord(a[0]) ^ a[1])) for a in zip(message, itertools.cycle(key))])
