from flask import Flask, request, render_template

app = Flask(__name__)

@app.route("/stadiums")
def hello_world():
    return "<p>Stadiums will be displayed!</p>"
