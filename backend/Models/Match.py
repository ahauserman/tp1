from flask_sqlalchemy import SQLAlchemy
from Models.base import db

class Match(db.Model):
    __tablename__ = 'matches'
    id_match = db.Column(db.Integer, primary_key=True)
    home_team_id = db.Column(db.Integer, nullable=False)
    away_team_id = db.Column(db.Integer, nullable=False)
    match_datetime = db.Column(db.TIMESTAMP, nullable=False)
    stadium_id = db.Column(db.Integer, nullable=False)
    score_home_team = db.Column(db.Integer,nullable=False)
    score_away_team = db.Column(db.Integer,nullable=False)
    match_group = db.Column(db.String(30),nullable=False)