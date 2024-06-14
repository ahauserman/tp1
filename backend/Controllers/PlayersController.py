from flask import Blueprint, jsonify
from Models.Player import Player

player_bp = Blueprint('players', __name__, url_prefix='/players')

@player_bp.route('/', methods=['GET'])
def get_all_players():
    try:
        players = Player.query.all()
        players_data = []
        for player in players:
            player_data = {
                'id_player': player.id_player,
                'player_name': player.player_name,
                'team': player.team,
                'photo': player.photo,
                'country': player.country,
                'position': player.position
                }
            players_data.append(player_data)
        return jsonify({'Players': players_data})
    except Exception as error:
        print('Error:',error)
        return jsonify({'message: ', error}), 500
    
@player_bp.route('/<id_player>', methods=['GET'])
def get_stadium_by_id(id_player):
    try:
        player = Player.query.where(player.id_player == id_player).first()
        player_data = {
                'id_player': player.id_player,
                'player_name': player.player_name,
                'team': player.team,
                'photo': player.photo,
                'country': player.country,
                'position': player.position
        }
        return jsonify({'Player': player_data})
    except Exception as error:
        print('Error:',error)
        return jsonify({'message: ', error}), 50