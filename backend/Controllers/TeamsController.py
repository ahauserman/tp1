from flask import Blueprint, jsonify
from Models.Team import Country
from Models.Player import Player

team_bp = Blueprint('teams', __name__, url_prefix='/teams')

@team_bp.route('/', methods=['GET'])
def get_all_teams():
    try:
        countries = Country.query.all()
        countries_data = []
        for country in countries:
            players = Player.query.where(Player.country == country.id_country).all()
            players_data = [
                {
                    'id': player.id_player,
                    'player_name': player.player_name,
                    'team': player.team,
                    'photo': player.photo,
                    'position': player.position
                } for player in players
            ]
            
            country_data = {
                'id_country': country.id_country,
                'country_name': country.country_name,
                'info': country.info,
                'photo': country.photo,
                'country_group': country.country_group,
                'titles': country.titles,
                'dt': country.dt,
                'players': players_data if players else []
            }
            countries_data.append(country_data)
        
        return jsonify({'Countries': countries_data})
    except Exception as error:
        print('Error:', error)
        return jsonify({'message': str(error)}), 500


    
@team_bp.route('/<id_country>', methods=['GET'])
def get_team_by_id(id_country):
    try:
        country = Country.query.where(Country.id_country == id_country).first()
        players = Player.query.where(Player.country == id_country).all()
        country_data = {
                'id_country': country.id_country,
                'country_name': country.country_name,
                'info': country.info,
                'photo': country.photo,
                'country_group': country.country_group,
                'titles': country.titles,
                'dt': country.dt,
                'players': [
                {
                    'id': player.id_player,
                    'name': player.player_name,
                    'team': player.team,
                    'photo': player.photo,
                    'position': player.position
                } for player in players
                ]
        }
        return jsonify({'Country': country_data})
    except Exception as error:
        print('Error:',error)
        return jsonify({'message: ', error}), 500