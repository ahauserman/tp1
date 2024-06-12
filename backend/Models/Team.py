import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Country(db.Model):
    __tablename__ = 'countries'
    id_country = db.Column(db.Integer, primary_key=True)
    country_name = db.Column(db.String(100), nullable=False)
    info = db.Column(db.String(1000), nullable=False)
    photo = db.Column(db.String(1000), nullable=False)
    group = db.Column(db.String(1), nullables=False)
    titles = db.Column(db.Integer, nullable=False)
    dt = db.Column(db.String(30), nullable=False)