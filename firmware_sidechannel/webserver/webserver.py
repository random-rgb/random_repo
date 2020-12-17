from flask import Flask
from flask import Flask, flash, redirect, render_template, request, session, abort
from flask.ext.scss import Scss
from flask_cors import CORS
import hashlib, json
import os
import tarfile

app = Flask(__name__, static_folder="./templates")
CORS(app)
Scss(app, static_dir='./templates', asset_dir='./templates')

@app.route('/')
def home():
	if not session.get('logged_in'):
		return render_template('Login/login.html')
	else:
		return render_template('Camera/camera.html')

def the_main_website():
	pass
	
@app.route('/moses')
def upload_firmware():
	# tf = tarfile.TarFile("zip-slip.tar")
	# tf.list()
	# tf.extractall()
	return render_template('firmware_upload/asd.html')
	

@app.route('/login', methods=['POST'])
def do_admin_login():
	creds = json.load("creds.json")
	is_valid_password = os.system("./authentication_provider {} {}".format()) # execute the authentication validator.
	if is_valid_password == 0:
		session['logged_in'] = True
	else:
		flash('wrong password!')
	return home()

if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=False,host='0.0.0.0', port=80)