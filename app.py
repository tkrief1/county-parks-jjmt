from flask import Flask, render_template, request, jsonify
import mysql.connector

# Initialize the Flask app
app = Flask(__name__)

# Connect to MySQL database
try:
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="password1!",
        database="jjmtdb"
    )
    print("Connection successful!")
    cursor = db.cursor()
    cursor.execute("SELECT * FROM trail_reports;")
    result = cursor.fetchall()
    for row in result:
        print(row)
except mysql.connector.Error as err:
    print(f"Error: {err}")

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

# Run the app
if __name__ == '__main__':
    app.run(debug=True)
