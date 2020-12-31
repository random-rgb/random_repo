# run with python 2.

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
	"help",
	"input"
]


serv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serv.bind(('0.0.0.0', 50000))
serv.listen(5)
while True:
	try:
		print "started"
		conn, addr = serv.accept()
		print "got connection"
		conn.send("Hello, this is my simple calculator\n")
		while True:
			try:
				operation = conn.recv(4096)
				print operation
				if any(f in operation for f in strings_not_allowed):
					message = "Do you think you can get out of my jail? {} is not allowed\n".format(strings_not_allowed)
					conn.send(message)

				else:
					try:
						ret_val = str(eval(operation))
						conn.send(ret_val + "\n")
					except NameError:
						message = "{} is not defined\n".format(operation)
						conn.send(message)
			except:
				message = "{} generic exception\n".format(operation)
				conn.send(message)
	except Exception as e:
		print e
