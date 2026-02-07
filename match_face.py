#!/usr/bin/env python
# coding: utf-8

# In[13]:


import cv2
import os
import face_recognition
from matplotlib import pyplot as plt
import json
import sys
import time


# Fungsi untuk mendeteksi dan mencocokan wajah pada gambar
def match_faces(input_image_path, dataset_dir):
    # Membaca gambar input menggunakan face_recognition
    input_image = face_recognition.load_image_file(input_image_path)
    input_face_encodings = face_recognition.face_encodings(input_image)

    # Mendapatkan daftar file gambar dalam direktori dataset
    dataset_images = [os.path.join(dataset_dir, file) for file in os.listdir(dataset_dir) if file.endswith('.jpg')]
    start = time.time()
    # proses
    end = time.time()
    execution_time = end - start
    
    # Looping untuk setiap gambar dalam dataset
    for dataset_image_path in dataset_images:
        # Membaca gambar dataset menggunakan face_recognition
        dataset_image = face_recognition.load_image_file(dataset_image_path)
        dataset_face_encodings = face_recognition.face_encodings(dataset_image)

        # Membandingkan setiap wajah pada gambar input dengan setiap wajah pada gambar dataset
        for input_encoding in input_face_encodings:
            for dataset_encoding in dataset_face_encodings:
                # Mencocokan wajah berdasarkan perbedaan encoding
                # match = face_recognition.compare_faces([input_encoding], dataset_encoding)
                face_distance = face_recognition.face_distance([input_encoding], dataset_encoding)[0]
                label = os.path.splitext(os.path.basename(dataset_image_path))[0]
                actual_match = (label == os.path.splitext(os.path.basename(input_image_path))[0])
                match = face_distance < 0.5  # threshold default
                predicted_match = match
                confidence = (1 - face_distance) * 100
                TP = 0
                FP = 0
                TN = 0
                FN = 0
                if predicted_match and actual_match:
                    TP += 1
                elif predicted_match and not actual_match:
                    FP += 1
                elif not predicted_match and actual_match:
                    FN += 1
                else:
                    TN += 1
                accuracy = (TP + TN) / (TP + TN + FP + FN)
                precision = TP / (TP + FP) if (TP + FP) != 0 else 0
                recall = TP / (TP + FN) if (TP + FN) != 0 else 0
                f1_score = 2 * (precision * recall) / (precision + recall) if (precision + recall) != 0 else 0

                
                # print("TP:", TP)
                # print("FP:", FP)
                # print("TN:", TN)
                # print("FN:", FN)
                # print("Accuracy:", accuracy)
                # print("Precision:", precision)
                # print("Recall:", recall)
                # print("F1 Score:", f1_score)

                if match:
                    # Jika ada wajah yang cocok, tampilkan gambar dan pesan cocok
                    dataset_image_filename = os.path.basename(dataset_image_path)
                    # dataset_image_relative_path = os.path.join('storage/app/public/assets/images/teacher', dataset_image_filename)
                    # dataset_image_relative_path = dataset_image_relative_path.replace("\\", "/")

                    # detect_faces(input_image_path)
                    # detect_faces(dataset_image_path)

                    result = {
                        'status': 'success',
                        'input_image': input_image_path,
                        'dataset_image': dataset_image_path,
                        'label': label,
                        'confidence_percent': float(confidence),
                        'time':float(execution_time),
                        'distance':float(face_distance)
                    }
                    print(json.dumps(result,indent=4))
                    return json.dumps(result)

                    

    # Jika tidak ada wajah yang cocok, tampilkan gambar input dan pesan tidak cocok
    # detect_faces(input_image_path)
   

    result = {
        'status': 'failed',
        'input_image': input_image_path,
        'dataset_image': None
    }
    # print(execution_time)
    print(json.dumps(result,indent=4))
    return json.dumps(result)



# Fungsi untuk mendeteksi wajah pada gambar
def detect_faces(image_path):
    # Membaca gambar menggunakan OpenCV
    image = cv2.imread(image_path)

    # Mengubah format gambar dari BGR ke RGB untuk ditampilkan menggunakan matplotlib
    image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    # Mendeteksi wajah pada gambar menggunakan face_recognition
    face_locations = face_recognition.face_locations(image_rgb)

    # Menggambar kotak di sekitar wajah yang terdeteksi
    for (top, right, bottom, left) in face_locations:
        cv2.rectangle(image_rgb, (left, top), (right, bottom), (255, 0, 0), 2)

    # Menampilkan gambar menggunakan matplotlib
    plt.imshow(image_rgb)
    plt.axis('off')
    plt.show()

# Path gambar input yang ingin dideteksi dan dicocokkan wajahnya
input_image_path = sys.argv[1]
role = sys.argv[2] if len(sys.argv) > 2 else "teacher"

# Direktori dataset yang berisi gambar-gambar wajah
# dataset_dir = 'D:\laragon\www\epoint-api\public\storage\assets\images\teacher'
# dataset_dir = "storage/assets/images/teacher"
# dataset_dir = os.path.normpath('public\storage\\assets\images\teacher')

dataset_dir = os.path.join(
    os.getcwd(),
    "public",
    "storage",
    "assets",
    "images",
    "teacher"
)

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

dataset_dir = os.path.join(
    BASE_DIR,
    "public",
    "storage",
    "assets",
    "images",
    role
)




# Membandingkan gambar input dengan gambar dalam dataset
match_faces(input_image_path, dataset_dir)


# In[ ]:




