from flask_sqlalchemy import SQLAlchemy
from Models.base import db

class Player(db.Model):
    __tablename__ = 'players'
    id_player = db.Column(db.Integer, primary_key=True)
    player_name = db.Column(db.String(100), nullable=False)
    team = db.Column(db.String(100), nullable=False)
    photo = db.Column(db.String(10000), nullable=False)
    country = db.Column(db.Integer, db.ForeignKey('countries.id_country'))
    position = db.Column(db.String(20), nullable=False)
    