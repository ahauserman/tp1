from flask_sqlalchemy import SQLAlchemy
from Models.base import db

class Player(db.Model):
    __tablename__ = 'players'
    id_ = db.Column(db.Integer, primary_key=True)
    _name = db.Column(db.String(100), nullable=False)
    team = db.Column(db.String(100), nullable=False)
    photo = db.Column(db.String(1000), nullable=False)
    country = db.Column(db.Integer, nullable=False)
    position = db.Column(db.String(20), nullable=False)