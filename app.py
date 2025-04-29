from flask import Flask, render_template, request, jsonify
import mysql.connector

app = Flask(__name__)

# Connect to your database
db = mysql.connector.connect(
    host="localhost",
    user="your_db_username",
    password="your_db_password",
    database="JJMTTrailDB"
)
cursor = db.cursor(dictionary=True)

# Home page
@app.route('/')
def home():
    return render_template('home.html')

# API: Submit new trail report
@app.route('/submit', methods=['POST'])
def submit_report():
    data = request.get_json()
    trail = data['trail']
    issue_type = data['issue_type']
    description = data['description']

    query = "INSERT INTO trail_reports (trail_name, issue_type, description) VALUES (%s, %s, %s)"
    cursor.execute(query, (trail, issue_type, description))
    db.commit()
    return jsonify({'message': 'Report submitted successfully'})

# API: Get all trail reports
@app.route('/reports', methods=['GET'])
def get_reports():
    cursor.execute("SELECT * FROM trail_reports")
    reports = cursor.fetchall()
    return jsonify(reports)

if __name__ == '__main__':
    app.run(debug=True)
