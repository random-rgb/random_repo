alphabet = [i for i in range(32, 127)]+[10]
getEnglish = lambda text: list(filter(lambda c: c in alphabet, text))
isEnglish = lambda text: len(getEnglish(text)) == len(text)

with open('msg', 'rb') as f:
	encrypted = f.read()
	samples = []
	for i in range(4):
		samples.append([val for index, val in enumerate(encrypted) if index % 4 == i])

print(samples)


keysFound = []
for a in range(256):
	decryptAttempt = [val ^ a for val in samples[0]]
	if isEnglish(decryptAttempt):
		print("a", a, decryptAttempt)
		for b in range(256):
			decryptAttempt = [val ^ b for val in samples[1]]
			if (isEnglish(decryptAttempt)):
				print("b", b, decryptAttempt)
				for c in range(256):
					decryptAttempt = [val ^ c for val in samples[2]]
					if (isEnglish(decryptAttempt)):
						for d in range(256):
							decryptAttempt = [val ^ d for val in samples[3]]
							if (isEnglish(decryptAttempt)):
								keysFound.append([a, b, c, d])
							
for keyset in keysFound:
	print(keyset)
	print(''.join(chr(c ^ keyset[i%4]) for i, c in enumerate(encrypted)))