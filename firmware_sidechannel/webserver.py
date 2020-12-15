from flask import Flask
from flask import Flask, flash, redirect, render_template, request, session, abort
import hashlib, json
import os

app = Flask(__name__)

@app.route('/')
def home():
	if not session.get('logged_in'):
		return render_template('login.html')
	else:
		return "Hello Boss!"

def the_main_website():
	# insert something with the zip slip.
	# Zip slip python poc code
	import tarfile
	tf = tarfile.TarFile("zip-slip.tar")
	tf.list()
	tf.extractall()
	pass

@app.route('/login', methods=['POST'])
def do_admin_login():
	creds = json.load("creds.json")
	is_valid_password = pass # execute the authentication validator.
	if request.form['username'] in creds.keys() and hashlib.md5(request.form['password']).hexdigest() == creds[request.form['username']]:
		session['logged_in'] = True
	else:
		flash('wrong password!')
	return home()

if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=True,host='0.0.0.0', port=4000)