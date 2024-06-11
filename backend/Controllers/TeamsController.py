from flask import Flask, request, render_template

app = Flask(__name__)

@app.route("/teams")
def hello_world():
    return "<p>Teams will be displayed!</p>"

