from flask import Flask, render_template, request, jsonify
import mysql.connector
from datetime import datetime

app = Flask(__name__)

# Connect to MySQL
try:
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="password1!",
        database="jjmtdb"
    )
    print("Connection successful!")
    cursor = db.cursor()
except mysql.connector.Error as err:
    print(f"Error: {err}")

# Home page
@app.route('/')
def home():
    return render_template('home.html')

# 📌 Updated route to match form submission
@app.route('/submit_report', methods=['POST'])
def submit_report():
    park = request.form.get('park')
    trail = request.form.get('trail')
    category = request.form.get('category')
    description = request.form.get('description')
    photo = request.files.get('photo')  # Optional: not used here
    submitername = "Anonymous"  # ← Add a form field later if needed

    # Insert into database
    query = """
        INSERT INTO trail_reports (park, trail, category, submitername, description, Date)
        VALUES (%s, %s, %s, %s, %s, %s)
    """
    cursor.execute(query, (park, trail, category, submitername, description, datetime.now()))
    db.commit()

    # Show success page
    return render_template('submit_success.html', park=park, trail=trail)

# Optional: return JSON for all reports
@app.route('/reports', methods=['GET'])
def get_reports():
    cursor.execute("SELECT * FROM trail_reports")
    reports = cursor.fetchall()
    return jsonify(reports)

if __name__ == '__main__':
    app.run(debug=True)
