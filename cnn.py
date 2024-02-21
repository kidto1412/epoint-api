#!/usr/bin/env python
# coding: utf-8

# In[6]:


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
# def load_dataset_images(dataset_path):
#     image_files = [file for file in os.listdir(dataset_path) if file.endswith(".jpg")]
#     dataset_images = []
#     dataset_encodings = []
#     for file in image_files:
#         image_path = os.path.join(dataset_path, file)
#         img = face_recognition.load_image_file(image_path)
#         encoding = face_recognition.face_encodings(img)[0]
#         dataset_images.append(img)
#         dataset_encodings.append(encoding)
#     return dataset_images, dataset_encodings

# def load_dataset_images(dataset_path):
#     image_files = [file for file in os.listdir(dataset_path) if file.endswith(".jpg")]
#     dataset_images = []
#     dataset_encodings = []
#     for file in image_files:
#         image_path = os.path.join(dataset_path, file)
#         img = face_recognition.load_image_file(image_path)
#         face_encodings = face_recognition.face_encodings(img)
#         if len(face_encodings) > 0:
#             encoding = face_encodings[0]
#             dataset_images.append(img)
#             dataset_encodings.append(encoding)
#         else:
#             # Handle the case where no face is detected in the image
#             # print(f"No face detected in {image_path}. Skipping.")
#     return dataset_images, dataset_encodings
# Function to load and preprocess images in the datasets folder

def load_dataset_images(dataset_path):
    image_files = [file for file in os.listdir(dataset_path) if file.endswith(".jpg")]
    dataset_images = []
    dataset_encodings = []
    for file in image_files:
        image_path = os.path.join(dataset_path, file)
        img = face_recognition.load_image_file(image_path)
        face_encodings = face_recognition.face_encodings(img)
        if len(face_encodings) > 0:
            encoding = face_encodings[0]
            dataset_images.append(img)
            dataset_encodings.append(encoding)
        else:
            # Handle the case where no face is detected in the image
            print(f"No face detected in {image_path}. Skipping.")
            # Skip adding this image to the dataset since there's no face detected
    return dataset_images, dataset_encodings



# Load and preprocess images in the datasets folder
dataset_path = "D:\laragon\www\epoint-api\\public\\storage\\assets\\images\\teacher"
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

# print("Accuracy:", accuracy)

# Check if any face is matched with the input image
if len(matched_images) > 0:
    # If faces are matched, process the matched images and return JSON output
    result = {
        'status': 'success',
        'input_image': input_image_path,
        'message': 'matched',
        'accuracy': accuracy
    }
else:
    # If no faces are matched, return JSON output accordingly
    result = {
        'status': 'failed',
        'input_image': input_image_path,
        'message': 'not matched',
        'accuracy': accuracy
    }

# Print the JSON result
print(json.dumps(result, indent=4))


# In[ ]:




