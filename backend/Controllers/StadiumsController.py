from flask import Blueprint, jsonify
from Models.Stadium import Stadium
from Models.Match import Match

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
        matches = Match.query.where(Match.stadium_id ==id_stadium).all()
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
                    'away_team_id': match.away_team_id,
                    'match_datetime': match.match_datetime,
                    'stadium_id': match.stadium_id,
                    'score_home_team': match.score_home_team,
                    'score_away_team': match.score_away_team,
                    'match_group': match.match_group
                } for match in matches
                ]
        }
        return jsonify({'stadiums': stadium_data})
    except Exception as error:
        print('Error:',error)
        return jsonify({'message: ', error}), 500