from flask import Flask, send_from_directory
from Models.Stadium import db
from Controllers.StadiumsController import stadium_bp
from flask_cors import CORS

app = Flask(__name__, static_folder='../frontend', static_url_path='/')
CORS(app)

port = 5000
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql+psycopg2://postgres:qwerty@localhost:5432/copaamerica'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

@app.route('/')
def serve_index():
    return send_from_directory('../frontend', 'index.html')

app.register_blueprint(stadium_bp)

if __name__ == '__main__':
    print('Starting server')
    db.init_app(app)
    with app.app_context():
        db.create_all()
    print('Started')
    app.run(host='0.0.0.0', debug=True, port=port)
