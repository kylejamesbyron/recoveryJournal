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
connection = sqlite3.connect("girls.db")
cursor = connection.cursor()

# end sqlite setup

#<Write Setup

# Login page
@app.route('/login')
def login():
	return render_template('login.html')
# login.html takes input (username, password)

@app.route('/login/check')
	def logincheck():
#		load database
#		pull variables for username and password
#		if username and password = correct
#			redirect to '/sobercheck'
#		else:
#			redirect to '/login/check/wrong'
# end Login

#Main Page
@app.route('/')
def main():
	return render_template('main.html')
# main.html





# Close Flask
if __name__ == '__main__':
   app.run(debug = True)