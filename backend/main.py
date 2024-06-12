from flask import Flask, jsonify, request, send_from_directory
from Models.Stadium import db 



app = Flask(__name__)
port = 5000
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql+psycopg2://postgres:qwerty@localhost:5432/copaamerica'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] =False

@app.route('/')
def hello_world():
    return send_from_directory('../frontend', 'index.html')

if __name__ == '__main__':
    print('Starting server')
    db.init_app(app)
    with app.app_context():
        db.create_all()
    print('Started')
    app.run(host='0.0.0.0', debug=True, port=port)