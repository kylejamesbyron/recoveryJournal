# Open Flask

from flask import Flask
from flask import send_file
from flask import render_template
from flask import request
import os

app = Flask(__name__)

# End of Opening

@app.route('/')
def appname():

	return render_template('name.html')






# Close Flask
if __name__ == '__main__':
   app.run(debug = True)