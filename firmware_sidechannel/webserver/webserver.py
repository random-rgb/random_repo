from flask import Flask
from flask import Flask, flash, redirect, render_template, request, session, abort
from flask_cors import CORS
import hashlib, json
import os
import tarfile


app = Flask(__name__, static_folder="./templates")
app.config['UPLOAD_FOLDER'] = "uploads"
CORS(app)

@app.route('/')
def home():
	if not session.get('logged_in'):
		return render_template('Login/login.html')
	else:
		return render_template('Camera/camera.html')

def the_main_website():
	pass
	
@app.route('/upload_firmware', methods=['POST'])
def upload_firmware():
	if session.get('logged_in'):
		if 'file' not in request.files:
			flash('No file part')
			return redirect(request.url)
		if file:
			file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
		file = request.files['firmware']
		tf = tarfile.TarFile("zip-slip.tar")
		tf.list()
		tf.extractall()
	

@app.route('/login', methods=['POST'])
def do_admin_login():
	input_username = request.form["username"]
	input_password = request.form["password"]
	creds = json.load("/home/creds.json")
	if input_username not in creds.keys():
		return render_template("failed_login/failed.html")
		
	is_valid_password = os.system("./authentication_provider {} {}".format()) # execute the authentication validator.
	if input_password == creds[input_username]:
		session['logged_in'] = True
	else:
		return render_template("failed_login/failed.html")
	return home()

if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=False,host='0.0.0.0', port=80)