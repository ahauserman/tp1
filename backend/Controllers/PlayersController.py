from flask import Blueprint, jsonify, request
from Models.Player import Player
from Models.base import db

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
    
@player_bp.route('/team/<id_country>', methods=['GET'])
def get_player_by_id(id_country):
    try:
        player = Player.query.where(player.id_player == id_country).first()
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
    
@player_bp.route('/create_player', methods=["POST"])
def create_player():
    try:
        data = request.json
        new_player_name = data.get('player_name')
        new_team = data.get('team')
        new_photo = data.get('photo')
        new_country = data.get('country')
        new_position = data.get('position')
        
        new_player = Player(player_name=new_player_name, team=new_team, photo=new_photo, country=new_country, position=new_position)
        db.session.add(new_player)
        db.session.commit()
        return jsonify({'New player': 'Yes'})
    except Exception as error:
        print('Error:', error)
        return jsonify({'message': str(error)}), 500

@player_bp.route('/update_player/<id_player>', methods=["PUT"])
def update_player(id_player):
    try:
        data = request.json
        player = Player.query.where(player.id_player == id_player).first()

        player.player_name = data.get('player_name', player.player_name)
        player.team = data.get('team', player.team)
        player.photo = data.get('photo', player.photo)
        player.country = data.get('country', player.country)
        player.position = data.get('position', player.position)

        db.session.commit()
        return jsonify({'message': 'Player updated successfully'})
    except Exception as error:
        print('Error:', error)
        return jsonify({'message': str(error)}), 500 
