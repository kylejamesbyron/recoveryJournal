# Open Flask

from flask import Flask
from flask import send_file
from flask import render_template
from flask import request
import os
from flask import session
import datetime


app = Flask(__name__)
app.secret_key = 'dljsaklqk24e21cjn!Ew@@dsa5'
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
	session['user']=username
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

@app.route('/newentry/submit', methods=['POST'])
def newentrysubmit():
	#username = request.form['username']
	username=session.get('user') 
	entry = request.form['newentry']
	entrydate = datetime.datetime.now()
	connection = sqlite3.connect("rjp.db")
	cursor = connection.cursor()
	cursor.execute("INSERT INTO entries (username, entry, entrydate) values (?, ?, ?)", (username, entry, entrydate))
	connection.commit()
	return render_template('/home.html')

# end new entry

# Display Journal

@app.route('/displayjournal')
def displayjournal():
	username=session.get('user') 
	connection = sqlite3.connect("rjp.db")
	cursor = connection.cursor()
	selection = cursor.execute('SELECT entrydate, entry from entries WHERE username = ?', [username])
	for row in selection:
		entryday = (row[0])
		entry = (row[1])
	return render_template('displayjournal.html', entryday=entryday, entry=entry)









# Close Flask
if __name__ == '__main__':
   app.run(debug = True)