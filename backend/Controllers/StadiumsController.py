from flask import Blueprint, jsonify
from Models.Stadium import db, Stadium

stadium_bp = Blueprint('stadium', __name__, url_prefix='/stadium')

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