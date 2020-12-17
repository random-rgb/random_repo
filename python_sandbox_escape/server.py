# Maybe move to python 2.7
import socket
import base64

strings_not_allowed = [
	"\'",
	"print",
	"import",
	"locals",
	"globals",
	"eval",
	"exit",
	"exec",
	"read",
	"write",
	"help"
]

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
	s.bind(("0.0.0.0", 50000))
	s.listen()
	while True:
		try:
			conn, addr = s.accept()
			conn.sendall(b"Hello, this is my simple calculator\n")
			while True:
				try:
					operation = str(conn.recv(4096))[2:-3]
					print(operation)
					if any(f in operation for f in strings_not_allowed):
						message = "Do you think you can get out of my jail? {} is not allowed\n".format(strings_not_allowed).encode()
						conn.sendall(message)

					else:
						try:
							ret_val = str(eval(operation))
							conn.sendall(ret_val.encode() + b"\n")
						except NameError:
							message = "{} is not defined\n".format(operation).encode()
							conn.sendall(message)
				except:
					message = "{} generic exception\n".format(operation).encode()
					conn.sendall(message)
		except:
			pass

