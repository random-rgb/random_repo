import tqdm

all_asd = [{}, {}, {}, {}]

def smart(a, i):
	if a not in all_asd[i].keys():
		all_asd[i][a] = [val ^ a for val in samples[i]]
	
	# return all_asd[i][a]
	return [val ^ a for val in samples[i]]

def find_keys(samples):
	keysFound = []
	for a in tqdm.tqdm(range(256)):
		decryptAttempt = smart(a, 0)
		if isEnglish(decryptAttempt):
			for b in range(256):
				decryptAttempt = smart(b, 1)
				if (isEnglish(decryptAttempt)):
					for c in range(256):
						decryptAttempt = smart(c, 2)
						if (isEnglish(decryptAttempt)):
							for d in range(256):
								decryptAttempt = smart(d, 3)
								if (isEnglish(decryptAttempt)):
									# print("d" , [chr(i) for i in decryptAttempt])
									# print(a,b,c,d)
									keysFound.append([a, b, c, d])
	
	return keysFound

	
def find_keys_2():
	pass
	
alphabet = [i for i in range(ord('a'),ord('z')+1,1)] + [ord(" ")]
getEnglish = lambda text: list(filter(lambda c: c in alphabet, text))
isEnglish = lambda text: len(getEnglish(text)) == len(text)

with open('msg', 'rb') as f:
	encrypted = f.read()[:-1]
	samples = []
	for i in range(4):
		samples.append([val for index, val in enumerate(encrypted) if index % 4 == i])

print(samples)


keysFound = find_keys(samples)
print(len(keysFound))

for keyset in keysFound:
	print(keyset)
	print(''.join(chr(c ^ keyset[i%4]) for i, c in enumerate(encrypted)))
	