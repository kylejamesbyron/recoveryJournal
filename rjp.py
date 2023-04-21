# Open Flask

from flask import Flask
from flask import send_file
from flask import render_template
from flask import request
import os

app = Flask(__name__)

# End of opening

# setup sqlite
import sqlite3
connection = sqlite3.connect("rjp.db")
cursor = connection.cursor()

# end sqlite setup

#<Write Setup

# Login page
@app.route('/')
def login():
	return render_template('login.html')
# login.html takes input (username, password)

@app.route('/login/check', methods=['POST'])
def logincheck():
	username = request.form['username']
	password = request.form['password']
	import sqlite3
	connection = sqlite3.connect("rjp.db")
	cursor = connection.cursor()
	selection = cursor.execute("SELECT password from users WHERE username = ?", [username])
	for row in selection:
		passw = (row[0])
	if password == passw:
		return render_template('/home.html')
	else:
		return "Failure"

# New Entry
@app.route('/newentry')
def newentry():
	return render_template('newentry.html')


# end Login

#Main Page
@app.route('/')
def main():
	return render_template('main.html')
# main.html





# Close Flask
if __name__ == '__main__':
   app.run(debug = True)