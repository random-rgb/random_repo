# run with python 3.6

from flask import Flask
from flask import Flask, flash, redirect, render_template, request, session, abort
from flask_cors import CORS
import os
import tarfile


app = Flask(__name__, static_folder="/home/webserver/templates")
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
		if 'camera_configuration' not in request.files:
			print 'No file part'
			return redirect(request.url)
			
		configuration_file = request.files['camera_configuration']
		if configuration_file and ".tar" in configuration_file.filename[-4:]:
			file_name = os.path.join(app.config['UPLOAD_FOLDER'], configuration_file.filename)
			configuration_file.save(file_name)
			tf = tarfile.TarFile(file_name)
			tf.extractall()

		os.system("/home/webserver/upload_firmware_log")

	elif session.get('logged_in') and request.method == 'GET':
		return render_template('upload_configuration/upload.html')
	else:
		return render_template("failed_login/failed.html")
	

@app.route('/login', methods=['POST'])
def do_admin_login():
	input_username = request.form["username"]
	input_password = request.form["password"]
	password = open("/home/camera_configuration/admin_pass.txt", "r").read()
	
	if "'" not in input_password and input_username == "admin":
		is_valid_password = os.system("/home/webserver/authentication_provider '{}' {}".format(input_password, password)) # execute the authentication validator.
		if is_valid_password == 0:
			session['logged_in'] = True
			return home()
	
	return render_template("failed_login/failed.html")
	

if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=False,host='0.0.0.0', port=80)