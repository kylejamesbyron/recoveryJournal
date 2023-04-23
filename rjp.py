# Open Flask

from flask import Flask
from flask import send_file
from flask import render_template
from flask import request
import os
from flask import session
import datetime
from datetime import datetime
from datetime import date
from datetime import time 


app = Flask(__name__)
app.secret_key = 'dljsaklqk24e21cjn!Ew@@dsa5'
# End of opening

# setup sqlite
import sqlite3
connection = sqlite3.connect("rjp.db")
cursor = connection.cursor()
# end sqlite setup

#<Write Setup
#home
@app.route('/home/')
def home():
	return render_template('home.html')

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
	selection = cursor.execute("SELECT password from users WHERE username = ?", 
		[username])
	for row in selection:
		passw = (row[0])
	if password == passw:
		return render_template('home.html')
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
	entrydate = date.today() 
	connection = sqlite3.connect("rjp.db")
	cursor = connection.cursor()
	cursor.execute("INSERT INTO entries (username, entry, entrydate) values (?, ?, ?)", 
		(username, entry, entrydate))
	connection.commit()
	return render_template('home.html')

# end new entry

# Display Journal

@app.route('/list')
def list():
	username=session.get('user')
	con = sqlite3.connect("rjp.db")
	con.row_factory = sqlite3.Row
	cur = con.cursor()
	cur.execute("SELECT * FROM entries WHERE username = ?", [username])
	rows = cur.fetchall();
	return render_template("list.html",rows = rows)

# Edit
@app.route('/edit/<userid>', methods=['POST'])
def edit(userid):
	username=session.get('user')
	#userid = request.form['idedit']
	userid = userid
	con = sqlite3.connect("rjp.db")
	con.row_factory = sqlite3.Row
	cur = con.cursor()
	cur.execute("SELECT * FROM entries WHERE username = ? AND ID = ?", [username, userid])
	rows = cur.fetchall();
	#oldentry = "This text will be inserted."
	return render_template('editentry.html', rows=rows)

@app.route('/edit/submit/<userid>', methods=['POST'])
def editsubmit(userid):
	username=session.get('user')
	entrynew = request.form['edit']
	entryid = userid
	#entryid = request.form['form']
	con = sqlite3.connect("rjp.db")
	con.row_factory = sqlite3.Row
	cur = con.cursor()
	cur.execute("UPDATE entries SET entry = ? WHERE username = ? AND ID = ?", (entrynew, username, entryid))
	con.commit()
	return render_template('home.html')



# Test


@app.route('/test/<userid>', methods=['POST'])
def test(userid):
	
		return render_template('test.html', userid=userid)
	





# Close Flask
if __name__ == '__main__':
   app.run(debug = True)