from flask import Blueprint, jsonify, request
from Models.Player import Player
from Models.base import db
from Models.Team import Country
from sqlalchemy.orm import aliased

player_bp = Blueprint('players', __name__, url_prefix='/players')
    
@player_bp.route('/<id_player>', methods=['GET'])
def get_player_by_id(id_player):
    try:
        player = Player.query.where(Player.id_player == id_player).first()
        playerCountry = aliased(Country)
        
        country_name = db.session.query(
            Country.country_name.label('country_name')
        ).join(
            playerCountry, player.country == playerCountry.id_country
        ).first()
        
        player_data = {
            'id_player': player.id_player,
            'player_name': player.player_name,
            'team': player.team,
            'photo': player.photo,
            'country': player.country,
            'position': player.position,
            'country_name': country_name.country_name
        }

        return jsonify({'Player': player_data})
    except Exception as error:
        print('Error:', error)
        return jsonify({'message': str(error)}), 500
    
    
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
        return jsonify({'success': 'true'})
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

@player_bp.route('/delete_player/<id_player>', methods=["DELETE"])
def delete_player(id_player):
    try:
        player = Player.query.where(Player.id_player == id_player).first()
        db.session.delete(player)
        db.session.commit()
        return jsonify({'success': 'true'})
    except Exception as error:
        print('Error:', error)
        return jsonify({'message': str(error)}), 500
