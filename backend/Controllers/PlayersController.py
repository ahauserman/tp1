from flask import Flask, request, render_template

app = Flask(__name__)

@app.route("/players")
def hello_world():
    return "<p>Players will be displayed!</p>"

"""
@app.route("/new", methods=['POST','GET'])
def new():
    if request.method=='GET':
        return render_template('index.html', request.method=='POST')
    if request.method=='POST':
        return "#(put these)""
        <html>
            <body>
            <p> Submitted successfully
            </p>
            </body>
        </html>
    "#(put these)""
"""