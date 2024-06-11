from flask import Flask, request, render_template

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/new", methods=['POST','GET'])
def new():
    if request.method=='GET':
        return render_template('index.html', request.method=='POST')
    if request.method=='POST':
        return """
        <html>
            <body>
            <p> Submitted successful
            </p>
            </body>
        </html>
    """
