import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Player(db.Model):
    __tablename__ = 'players'
    id_player = db.Column(db.Integer, primary_key=True)
    player_name = db.Column(db.String(100), nullable=False)
    team = db.Column(db.String(100), nullable=False)
    photo = db.Column(db.String(1000), nullable=False)
    country = db.Column(db.Integer, nullable=False)
    position = db.Column(db.String(20), nullable=False)