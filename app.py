from flask import Flask, render_template, request, jsonify
import mysql.connector

app = Flask(__name__)

# Connect to your database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password1!",
    database="jjmtdb"
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
    park = data['park']
    trail = data['trail']
    category = data['category']
    submitername = data['submitername']
    description = data['description']

    query = "INSERT INTO trail_reports (park, trail, category, submitername, description) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(query, (park, trail, category, submitername, description))
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
