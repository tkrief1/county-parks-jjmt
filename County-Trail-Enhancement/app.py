from flask import Flask, render_template, url_for, request, redirect, flash, session
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import mysql.connector
from datetime import datetime
import os

db_host = os.environ.get('DATABASE_HOST', 'localhost')
db_user = os.environ.get('DATABASE_USER')
db_password = os.environ.get('DATABASE_PASSWORD')
db_name = os.environ.get('DATABASE_NAME')

UPLOAD_FOLDER = '/static/uploads/'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}

app = Flask(__name__)
app.config['SECRET_KEY'] = 'supersecret'

app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+mysqlconnector://{db_user}:{db_password}@{db_host}/{db_name}"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024 # 16MB limit

# Ensure the upload directory exists
os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)

db = SQLAlchemy(app)

class Incident(db.Model):
    __tablename__ = 'Incidents'

    incidentNum = db.Column(db. Integer, primary_key=True)
    ParkName = db.Column(db.String(45))
    TrailName = db.Column(db.String(45))
    SubmiterName = db.Column(db.String(45))
    Contact = db.Column(db.String(45))
    Date = db.Column(db.DateTime(6), default=datetime.utcnow)
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

@app.route('/submit_report', methods=['POST'])
def submit_report():
    if request.method == 'POST':
        park = request.form['park']
        trail = request.form['trail']
        submiter = request.form['submiter']
        contact = request.form['contact']
        category = request.form['category']
        description = request.form['description']
        priority = request.form.get('priority', 'Medium')

        # Handle optional file upload
        photo = request.files.get['photo']
        photo_url = ''
        if photo and photo.filename != '': # and allowed_file(photo.filename):
            ext = photo.filename.rsplit('.', 1)[1].lower()
            filename = f"{uuid.uuid4().hex}.{ext}"
            photo_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            photo.save(photo_path)
            photo_url = f"{app.config['UPLOAD_FOLDER']}/{filename}"

        new_report = Incident(
            ParkName=park,
            TrailName=trail,
            SubmiterName=submiter,
            Contact=contact,
            Date=datetime.utcnow(),
            Category=category,
            Description=description,
            PhotoURL=photo_url,
            Status='New',
            StaffAssign='',
            Priority=priority
        )

        db.session.add(new_report)
        db.session.commit()

        flash('Trail report submitted successfully.')
        return redirect(url_for('home'))

    return redirect(url_for('home'))

@app.route('/dashboard')
def staff_dashboard():
    incidents = Incident.query.order_by(Incident.Date.desc()).all()
    # Check if each incident's photo file actually exists
    for incident in incidents:
        if incident.PhotoURL:
            full_path = os.path.join(app.root_path, incident.PhotoURL.lstrip('/'))  # Converts relative to absolute path
            if not os.path.exists(full_path):
                incident.PhotoURL = None
    
    return render_template('staff_dashboard.html', incidents=incidents)

@app.route('/admin')
def admin():
    incidents = Incident.query.all()
    return render_template('admin.html', incidents=incidents)

@app.route('/delete_incident/<int:incident_id>', methods=['POST'])
def delete_incident(incident_id):
    incident = Incident.query.filter_by(incidentNum=incident_id).first_or_404()
    db.session.delete(incident)
    db.session.commit()
    flash(f'Incident #{incident.incidentNum} deleted successfully.')
    return redirect(url_for('admin'))

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)


