import os
from flask import Flask, request, jsonify
from keras.models import load_model
import pandas as pd
import numpy as np
import cv2
from flask_cors import CORS

app = Flask(__name__)

CORS(app, supports_credentials=True, origins="*")

model = load_model("./model/weights/herbal-ai-class.h5")
df = pd.read_csv("./model/index.csv")

IMAGE_SIZE = (160, 160)


def preprocess_image(file):
    image = cv2.imdecode(np.frombuffer(file.read(), np.uint8), cv2.IMREAD_COLOR)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    image = cv2.resize(image, IMAGE_SIZE)
    image = np.expand_dims(image, axis=0)
    image = np.array(image, dtype="float32")
    image = image / 255.0
    return image


def classify_outlier(index, confidence, confidence_threshold=0.7):
    if confidence_threshold and confidence_threshold < 1.0:
        if confidence < confidence_threshold:
            return "Unknown or Outlier"
    return get_class(index)


def get_class(index: np.intp):
    return df.loc[df["Index"] == index, "Class"].values[0]


@app.route("/", methods=["GET"])
def home():
    return jsonify({"message": "Welcome to Herbal-AI"})


@app.route("/classify", methods=["POST"])
def classify():
    try:
        if "file" not in request.files:
            return jsonify({"error": "No file part"})

        file = request.files["file"]

        if not file:
            return jsonify({"error": "File not found"})

        if file.filename == "":
            return jsonify({"error": "No selected file"})

        image = preprocess_image(file)

        prediction = model.predict(image)  # type: ignore
        index = np.argmax(prediction[0])
        accuracy = prediction[0][index]
        classification_result = classify_outlier(
            index, accuracy, confidence_threshold=0.7
        )

        return jsonify(
            {
                "status": "success",
                "result": classification_result,
                "accuracy": "{:.2f}".format(accuracy * 100),
            }
        )
    except Exception as e:
        return jsonify(
            {
                "status": "error",
                "error": str(e),
            }
        )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT") or 8000), debug=True)
