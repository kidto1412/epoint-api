#!/usr/bin/env python
# coding: utf-8

# In[2]:


import os
import numpy as np
import cv2
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D, Flatten, Dense
from keras.preprocessing import image
import face_recognition
import json
import sys

# Function to load and preprocess images in the datasets folder
def load_dataset_images(dataset_path):
    image_files = [file for file in os.listdir(dataset_path) if file.endswith(".jpg")]
    dataset_images = []
    dataset_encodings = []
    for file in image_files:
        image_path = os.path.join(dataset_path, file)
        img = face_recognition.load_image_file(image_path)
        encoding = face_recognition.face_encodings(img)[0]
        dataset_images.append(img)
        dataset_encodings.append(encoding)
    return dataset_images, dataset_encodings

# Load and preprocess images in the datasets folder
dataset_path = "storage/app/public/assets/images/teacher"
dataset_images, dataset_encodings = load_dataset_images(dataset_path)

# Function to match a new face with the images in the datasets folder
def match_face(input_image, dataset_images, dataset_encodings):
    input_encoding = face_recognition.face_encodings(input_image)[0]

    # Compare face encodings with the input encoding
    matches = face_recognition.compare_faces(dataset_encodings, input_encoding)
    matched_images = [img for img, match in zip(dataset_images, matches) if match]

    accuracy = sum(matches) / len(matches) if len(matches) > 0 else 0.0
    return matched_images, accuracy

# Example usage
input_image_path = sys.argv[1]  # Replace with the path to the input image
input_image = face_recognition.load_image_file(input_image_path)

matched_images, accuracy = match_face(input_image, dataset_images, dataset_encodings)

print("Accuracy:", accuracy)

if len(matched_images) > 0:
    for i, img in enumerate(matched_images):
        print("Found")
        result = {
            'status': 'failed',
            'input_image': input_image_path,
            'dataset_image': dataset_path + '/' + input_image_path
        }
        print(json.dumps(result, indent=4))
        print('success')


else:
    print("No match found")
    result = {
            'status': 'failed',
            'input_image': input_image_path,
            'dataset_image': None
        }
    print(json.dumps(result, indent=4))
    print('failed')


# In[ ]:




