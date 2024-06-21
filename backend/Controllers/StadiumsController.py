from flask import Blueprint, jsonify
from Models.Stadium import Stadium
from Models.Match import Match
from Models.Team import Country
from Models.base import db
from sqlalchemy.orm import aliased

stadium_bp = Blueprint('stadiums', __name__, url_prefix='/stadiums')

@stadium_bp.route('/', methods=['GET'])
def get_all_stadiums():
    try:
        stadiums = Stadium.query.all()
        stadiums_data = []
        for stadium in stadiums:
            stadium_data = {
                'id_stadium': stadium.id_stadium,
                'stadium_name': stadium.stadium_name,
                'city': stadium.city,
                'photo': stadium.photo,
                'capacity': stadium.capacity
            }
            stadiums_data.append(stadium_data)
        return jsonify({'stadiums': stadiums_data})
    except Exception as error:
        print('Error:',error)
        return jsonify({'message: ', error}), 500
    
@stadium_bp.route('/<id_stadium>', methods=['GET'])
def get_stadium_by_id(id_stadium):
    try:
        stadium = Stadium.query.where(Stadium.id_stadium == id_stadium).first()

        HomeCountry = aliased(Country)
        AwayCountry = aliased(Country)

        matches = db.session.query(
            Match.id_match,
            Match.home_team_id,
            Match.away_team_id,
            Match.match_datetime,
            Match.stadium_id,
            Match.score_home_team,
            Match.score_away_team,
            Match.match_group,
            HomeCountry.country_name.label('home_team_name'),
            AwayCountry.country_name.label('away_team_name'),
            HomeCountry.photo.label('home_team_photo'),
            AwayCountry.photo.label('away_team_photo')
        ).join(
            HomeCountry, Match.home_team_id == HomeCountry.id_country
        ).join(
            AwayCountry, Match.away_team_id == AwayCountry.id_country
        ).filter(
            Match.stadium_id == id_stadium
        ).all()

        stadium_data = {
            'id_stadium': stadium.id_stadium,
            'stadium_name': stadium.stadium_name,
            'city': stadium.city,
            'photo': stadium.photo,
            'capacity': stadium.capacity,
            'matches': [
                {
                    'id_match': match.id_match,
                    'home_team_id': match.home_team_id,
                    'home_team_name': match.home_team_name,
                    'away_team_id': match.away_team_id,
                    'away_team_name': match.away_team_name,
                    'match_datetime': match.match_datetime,
                    'stadium_id': match.stadium_id,
                    'score_home_team': match.score_home_team,
                    'score_away_team': match.score_away_team,
                    'match_group': match.match_group,
                    'home_team_photo': match.home_team_photo,
                    'away_team_photo': match.away_team_photo
                } for match in matches
            ]
        }

        return jsonify({'stadiums': stadium_data})
    except Exception as error:
        print('Error:', error)
        return jsonify({'message': str(error)}), 500
