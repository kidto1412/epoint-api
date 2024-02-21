#!/usr/bin/env python
# coding: utf-8

# In[2]:


import sys
import cv2
import os
import face_recognition
from matplotlib import pyplot as plt

# Fungsi untuk mendeteksi dan mencocokan wajah pada gambar
def match_faces(input_image_path, dataset_dir):
    # Membaca gambar input menggunakan face_recognition
    input_image = face_recognition.load_image_file(input_image_path)
    input_face_encodings = face_recognition.face_encodings(input_image)

    # Mendapatkan daftar file gambar dalam direktori dataset
    dataset_images = [os.path.join(dataset_dir, file) for file in os.listdir(dataset_dir) if file.endswith('.jpg')]

    # Looping untuk setiap gambar dalam dataset
    for dataset_image_path in dataset_images:
        # Membaca gambar dataset menggunakan face_recognition
        dataset_image = face_recognition.load_image_file(dataset_image_path)
        dataset_face_encodings = face_recognition.face_encodings(dataset_image)

        # Membandingkan setiap wajah pada gambar input dengan setiap wajah pada gambar dataset
        for input_encoding in input_face_encodings:
            for dataset_encoding in dataset_face_encodings:
                # Mencocokan wajah berdasarkan perbedaan encoding
                match = face_recognition.compare_faces([input_encoding], dataset_encoding)
                if match[0]:
                    # Jika ada wajah yang cocok, tampilkan gambar dan pesan cocok
                    detect_faces(dataset_image_path)
                    print("success")
                    return

    # Jika tidak ada wajah yang cocok, tampilkan gambar input dan pesan tidak cocok
    detect_faces(input_image_path)
    print("failed")

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

# Direktori dataset yang berisi gambar-gambar wajah
dataset_dir = '../../../../public/storage/assets/images/teacher'

# Membandingkan gambar input dengan gambar dalam dataset
match_faces(input_image_path, dataset_dir)


# In[ ]:




