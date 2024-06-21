from flask import Blueprint, jsonify, request
from Models.Match import Match
from datetime import datetime

match_bp = Blueprint('matches', __name__, url_prefix='/matches')

@match_bp.route('/', methods=['GET'])
def get_all_matches():
    try:
        matches = Match.query.order_by(Match.match_datetime).all()
        macthes_data = []
        for match in matches:
            match_data = {
                'id_match': match.id_match,
                'home_team_id': match.home_team_id,
                'away_team_id': match.away_team_id,
                'match_datetime': match.match_datetime,
                'stadium_id': match.stadium_id,
                'score_home_team': match.score_home_team,
                'score_away_team': match.score_away_team,
                'match_group': match.match_group
            }
            macthes_data.append(match_data)
        return jsonify({'matches': macthes_data})
    except Exception as error:
        print('Error:',error)
        return jsonify({'message: ', error}), 500
    
@match_bp.route('/next_match', methods=['GET'])
def get_next_match():
    try:
        next_match = Match.query.filter(Match.match_datetime > datetime.now()).order_by(Match.match_datetime).first()
        if next_match:
            next_match_data = {
                'id_match': next_match.id_match,
                'home_team_id': next_match.home_team_id,
                'away_team_id': next_match.away_team_id,
                'match_datetime': next_match.match_datetime.strftime('%Y-%m-%d %H:%M:%S'),
                'stadium_id': next_match.stadium_id,
                'score_home_team': next_match.score_home_team,
                'score_away_team': next_match.score_away_team,
                'match_group': next_match.match_group
            }
            return jsonify({'next_match': next_match_data})
        else:
            return jsonify({'message': 'No upcoming matches found'}), 404
    except Exception as error:
        print('Error:', error)
        return jsonify({'message': str(error)}), 500