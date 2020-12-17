from flask import Flask
from flask import Flask, flash, redirect, render_template, request, session, abort
from flask_cors import CORS
import hashlib, json
import os
import tarfile


app = Flask(__name__, static_folder="./templates")
app.config['UPLOAD_FOLDER'] = "/home/camera_configuration"
CORS(app)

@app.route('/')
def home():
	if not session.get('logged_in'):
		return render_template('Login/login.html')
	else:
		return render_template('Camera/camera.html')

	
@app.route('/upload_configuration', methods=['POST', 'GET'])
def upload_firmware():
	if session.get('logged_in') and request.method == 'POST':
		if 'file' not in request.files:
			flash('No file part')
			return redirect(request.url)
		
		if file and ".tar" in file.filename[-4:]:
			file_name = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
			file.save(file_name)
			tf = tarfile.TarFile(file_name)
			tf.list()
			tf.extractall()

	elif session.get('logged_in') request.method == 'GET':
			return render_template('upload_configuration/upload.html')
	else:
		return render_template("failed_login/failed.html")
	

@app.route('/login', methods=['POST'])
def do_admin_login():
	input_username = request.form["username"]
	input_password = request.form["password"]
	creds = json.load(open("/home/camera_configuration/creds.json", "r"))
	if input_username not in creds.keys():
		return render_template("failed_login/failed.html")
		
	is_valid_password = os.system("./authentication_provider {} {}".format(input_password, creds[input_username])) # execute the authentication validator.
	if is_valid_password == 0:
		session['logged_in'] = True
	else:
		return render_template("failed_login/failed.html")
	return home()

if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=False,host='0.0.0.0', port=80)