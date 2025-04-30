from flask import Flask, render_template, url_for, request, redirect, flash, session
from flask_sqlalchemy import SQLAlchemy
import os
import mysql.connector

db_host = os.environ.get('DATABASE_HOST', 'localhost')
db_user = os.environ.get('DATABASE_USER')
db_password = os.environ.get('DATABASE_PASSWORD')
db_name = os.environ.get('DATABASE_NAME')

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+mysqlconnector://{db_user}:{db_password}@{db_host}/{db_name}"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Incident(db.Model):
    __tablename__ = 'Incidents'

    incidentNum = db.Column(db. Integer, primary_key=True)
    ParkName = db.Column(db.String(45))
    TrailName = db.Column(db.String(45))
    Date = db.Column(db.String(45))
    Category = db.Column(db.String(45))
    Description = db.Column(db.String(1000))
    PhotoURL = db.Column(db.String(45))
    Status = db.Column(db.String(45))
    StaffAssign = db.Column(db.String(45))
    Priority = db.Column(db.String(45))

with app.app_context():
    db.create_all()

@app.route('/')
def home():
    incidents = Incident.query.order_by(Incident.incidentNum.desc()).limit(10).all()
    print(f"Found {len(incidents)} incidents")
    return render_template('home.html', incidents=incidents)


@app.route('/dashboard')
def staff_dashboard():
    return render_template('staff_dashboard.html')

@app.route('/admin')
def admin():
    incidents = Incident.query.all()
    return render_template('admin.html', incidents=incidents)

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)
