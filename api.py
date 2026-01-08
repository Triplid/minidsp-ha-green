from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route("/status", methods=["GET"])
def status():
    return jsonify({"preset": "1", "input": "USB", "volume": "0 dB"})

@app.route("/preset", methods=["GET", "POST"])
def preset():
    if request.method == "GET":
        return jsonify({"preset": "1"})
    p = (request.get_json(silent=True) or {}).get("preset", "1")
    return jsonify({"result": f"Preset set to {p}"})

@app.route("/input", methods=["GET", "POST"])
def input_route():
    if request.method == "GET":
        return jsonify({"input": "USB"})
    i = (request.get_json(silent=True) or {}).get("input", "USB")
    return jsonify({"result": f"Input set to {i}"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
