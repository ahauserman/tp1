from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()

class Stadium(db.Model):
    __tablename__ = 'stadiums'
    id_stadium = db.Column(db.Integer, primary_key=True)
    stadium_name = db.Column(db.String(100), nullable=False)
    place = db.Column(db.String(100), nullable=False)
    photo = db.Column(db.String(1000), nullable=False)
    capacity = db.Column(db.Integer, nullable=False)