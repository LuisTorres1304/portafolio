from flask import Flask
from routes.contacts import contacts
from flask_sqlalchemy import SQLAlchemy
app = Flask(__name__)

# https://flask.palletsprojects.com/en/2.2.x/patterns/flashing/
app.secret_key = "secret key"

app.config['SQLALCHEMY_DATABASE_URI']= 'sqlite:///database/contact.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
SQLAlchemy(app)

app.register_blueprint(contacts)