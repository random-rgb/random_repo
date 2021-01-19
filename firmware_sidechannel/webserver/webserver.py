# run with python 2.7
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

	
@app.route('/change_password', methods=['POST', 'GET'])
def change_password():
	if session.get('logged_in') and request.method == 'POST':
		if 'camera_configuration' not in request.files:
			print 'No file part'
			return redirect(request.url)
			
		configuration_file = request.files['camera_configuration']
		if configuration_file and ".tar" in configuration_file.filename[-4:]:
			file_name = os.path.join(app.config['UPLOAD_FOLDER'], configuration_file.filename)
			configuration_file.save(file_name)
			tf = tarfile.TarFile(file_name)
			tf.extractall(path="/home/camera_configuration")

		os.system("/home/webserver/password_change_log")
		return render_template()

	elif session.get('logged_in') and request.method == 'GET':
		return render_template('change_password/upload.html')
	else:
		return render_template("failed_login/failed.html")
	
def validate_password(input_password):
	allowed_chars = [chr(c) for c in range(ord("a"), ord("z")+1)] + [chr(c) for c in range(ord("A"), ord("Z")+1)] + [chr(c) for c in range(ord("1"), ord("9")+1)] + ["_"]
	return not any(c not in allowed_chars for c in input_password)


@app.route('/login', methods=['POST'])
def do_admin_login():
	input_username = request.form["username"]
	input_password = request.form["password"]
	password = open("/home/camera_configuration/admin_pass.txt", "r").read()
	
	if validate_password(input_password) and input_username == "admin":
		is_valid_password = os.system("/home/webserver/authentication_provider '{}' '{}'".format(input_password, password)) # execute the authentication validator.
		if is_valid_password == 0:
			session['logged_in'] = True
			return home()
	
	return render_template("failed_login/failed.html")

@app.route("/logout")
def	logout():
	session['logged_in'] = False
	return redirect("/login")


if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=False,host='0.0.0.0', port=80)