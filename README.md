# Optical Coherence Tomography (OCT) Image Processing of Glass Substrates

## 📌 Project Overview

This project presents the digital processing and analysis of Optical Coherence Tomography (OCT) scans performed on glass substrates **with and without TiO₂ gel dopant**.

The objective is to investigate how the dopant modifies the internal structure and optical response of the material using MATLAB-based signal and image processing.

---

## 🎯 Purpose of OCT in This Project

Optical Coherence Tomography (OCT) is a non-invasive imaging technique used to obtain high-resolution cross-sectional images.

In this project, OCT is used to:

- Visualize internal microstructures of glass substrates  
- Compare doped vs. undoped samples  
- Detect changes in reflectivity and scattering  
- Enable both qualitative and quantitative material analysis  

---

## 💻 Why Digital Signal & Image Processing?

OCT data was acquired as electrical signal in the (H and V channels), . Digital processing is required to:

- Convert raw data signals into meaningful depth images/profiles (A-scans)  
- Apply calibration using a scaling table  
- Reduce noise and improve signal quality  
- Reconstruct 2D and 3D OCT images  
- Extract quantitative parameters for analysis  

---

## 🧪 Why TiO₂ Dopant Was Added

Titanium dioxide (TiO₂) was introduced into the glass substrate to modify its properties:

- **High refractive index** → alters light interaction  
- Introduces **scattering centers** → affects OCT signal  
- Modifies **internal structure** at micro/nano scale  
- Improves **mechanical and optical properties**  

👉 The goal is to observe how these changes appear in OCT imaging and signal profiles.

---

## 📂 Data Description

- `RawDATA_H.csv` → Horizontal channel OCT signal  
- `RawDATA_V.csv` → Vertical channel OCT signal  
- `2D.bmp` → Raw OCT image from system  
- `A_scan_final.csv` → Processed depth signal (A-scan)  
- `scaling_table.txt` → Calibration data for rescaling  

---

## 📊 What is an A-Scan?

An **A-scan** is a 1D depth profile of the sample:

- X-axis → depth (sample index)  
- Y-axis → reflected signal intensity  

👉 Multiple A-scans stacked together form:
- **B-scan (2D image)**  
- **3D volumetric OCT image**

---

## ⚙️ MATLAB Processing Pipeline

1. Load raw OCT data (CSV files)  
2. Reshape data into B-scan format  
3. Apply calibration using scaling table
   ![Calibration](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/Calibration/Calibration.PNG)
5. Perform signal processing:
   - FFT (frequency domain conversion)
   - Optional filtering / Hilbert transform  
6. Extract meaningful depth information  
7. Visualize results:
   - 2D OCT image  
   - 3D mesh plot  

---

## 📈 Quantitative Analysis

The following metrics are extracted to compare doped vs. undoped samples:

- **Signal Intensity Profile**  
  → Peak reflectivity differences  

- **Layer Thickness Estimation**  
  → Distance between peaks in A-scan  

- **Signal Attenuation / Decay**  
  → Indicates scattering and absorption  

- **Signal-to-Noise Ratio (SNR)**  
  → Measures image quality  

👉 These provide objective insight into how TiO₂ affects the material.

---

## 🖼️ Results

### Undoped Glass (Baseline)
![Undoped](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/Microscope_slide/OCT_screen_capture.PNG)

### TiO₂ Doped Glass
![Doped](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/GelCoat/OCT_screen_capture.PNG)

### 3D OCT Reconstruction
![3D](./results/3d_view.png)

---
