from flask import Blueprint, jsonify
from Models.Team import Country

team_bp = Blueprint('teams', __name__, url_prefix='/teams')

@team_bp.route('/', methods=['GET'])
def get_all_teams():
    try:
        countries = Country.query.all()
        countries_data = []
        for country in countries:
            country_data = {
                'id_country': country.id_country,
                'country_name': country.country_name,
                'info': country.info,
                'photo': country.photo,
                'country_group': country.country_group,
                'titles': country.titles,
                'dt': country.dt
                }
            countries_data.append(country_data)
        return jsonify({'Countries': countries_data})
    except Exception as error:
        print('Error:',error)
        return jsonify({'message: ', error}), 500
    
@team_bp.route('/<id_country>', methods=['GET'])
def get_team_by_id(id_country):
    try:
        country = Country.query.where(Country.id_country == id_country).first()
        country_data = {
                'id_country': country.id_country,
                'country_name': country.country_name,
                'info': country.info,
                'photo': country.photo,
                'country_group': country.country_group,
                'titles': country.titles,
                'dt': country.dt
        }
        return jsonify({'Country': country_data})
    except Exception as error:
        print('Error:',error)
        return jsonify({'message: ', error}), 500