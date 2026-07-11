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
- acts as **scattering agent ** → affects OCT signal  
- Modifies **internal structure** at micro/nano scale  
- Improves **mechanical and optical properties**
- TiO₂ is a very common choice as a scattering agent in OCT phantoms and as calibration reference, for a few specific reasons:
1. Strong, controllable backscatter
Because TiO₂ has such a high refractive index (~2.4–2.7) relative to the surrounding matrix (resin, silicone, gelatin, etc. ~1.4–1.5), it scatters light very efficiently. This lets you dial in a known scattering coefficient (μs) by controlling TiO₂ concentration — useful for building phantoms that mimic the optical scattering properties of biological tissue.
2. Simulating tissue-like optical properties
Real biological tissue scatters light due to structural variations (cell membranes, organelles, collagen fibers). TiO₂ particles in a phantom stand in for that — giving you a reproducible, tissue-mimicking scattering medium so you can test OCT system performance (axial resolution, sensitivity roll-off, penetration depth) without using actual tissue.
3. Stability and reproducibility
Unlike biological samples, TiO₂-doped phantoms don't degrade, dry out, or change scattering properties over time — making them good as long-term calibration standards or references for comparing system performance across measurement sessions.
4. Particle size tunability
Different TiO₂ particle sizes (nanometer to micrometer range) let you tune the scattering behavior — smaller particles favor more isotropic (Rayleigh-like) scattering, larger particles behave more like Mie scattering, closer to real tissue structures.


👉 The goal is to observe how these changes appear in OCT imaging and signal profiles.

---

## 📂 Data Description

- `RawDATA_H.csv` → Horizontal channel OCT signal  
- `RawDATA_V.csv` → Vertical channel OCT signal
- `RowDATA_H.csv` → Horizontal channel OCT signal with Gelcoat
- `RowDATA_V.csv` → Vertical channel OCT signal with Gelcoat  
- `2D.bmp` → Raw OCT image from system
- Microscope_slide → Raw data without Gelcoat
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

1. Load row/raw OCT data (CSV files)  
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

The following metrics were extracted to compare doped vs. undoped samples:

- **Signal Intensity Profile**  
  → Peak reflectivity differences  

- **Layer Thickness Estimation**  
  → Distance between peaks in A-scan  

- **Signal Attenuation / Decay**  
  → Indicates scattering and absorption  

- **Signal-to-Noise Ratio (SNR)**  
  → Measures image quality  

👉 Results not presented here. These provide quantitative insight into how TiO₂ affects the glass and how its concentration can be used for building phantoms that mimic the optical scattering properties of biological tissue.

---

## 🖼️ Results

### Undoped Glass (Baseline)
![Undoped](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/Microscope_slide/OCT_screen_capture.PNG)

### TiO₂ Doped Glass
![Doped](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/GelCoat/OCT_screen_capture.PNG)

---

## MATLAB Postprocessing 
With TiO2(Row) vs Without TiO2 (Raw)

## 1. Row / Raw A-line Signal

A single OCT A-line (depth profile) for both polarization channels, H and V, showing the raw interferogram before any processing.
![With TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/GelCoat-RowAline.png)
![Without TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/RawAline.png)

## 2. Row / Raw B-scan (Unscaled)

The raw B-scan assembled from 500 consecutive A-lines, shown before k-space linearization. The visible curvature is caused by the spectrometer's non-linear wavelength sampling.
![With TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/GelCoat-OCT-Bscan.png)
![Without TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/RawBscan.png)

## 3. Rescaled B-scan (Linear-in-k)

After applying the k-space rescaling table, each A-line is resampled onto a linear-in-wavenumber grid — a required correction before the FFT step.
![With TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/GelCoat-RescaledBscan.png)
![Without TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/RescaledBscan.png)

## 4. Reconstructed OCT B-scan

The final depth-resolved B-scan after FFT reconstruction, with the near-DC autocorrelation artifact cropped out and converted to a log-magnitude (dB) scale. We could observe less reconstruction with the GelCoat-OCT scan due to the TiO2 dopant acting as optical scaterring agent.

![With TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/GelCoat-OCT_Bscan.png)
![Without TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/OCT_Bscan.png)

---

### File.gif

1. Row / Raw B-scan (Unscaled)
![With TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/GelCoat-RowBscan_rotation.gif)
![Without TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/RawBscan_rotation.gif)
3. Rescaled B-scan (Linear-in-k)
![With TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/GelCoat-RescaledBscan_rotation.gif)
![Without TiO2](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/RescaledBscan_rotation.gif)


---

Signal Filtering — Low-Pass Denoising on GelCoat-OCTBscan

To reduce broadband noise in the raw signal, a low-pass filter was applied to attenuate high-frequency noise components while preserving the dominant low-frequency content of the signal.

As shown below, the filtered spectrogram shows a clear reduction in the speckled, high-frequency noise present throughout the original signal, while the primary low-frequency band — corresponding to the signal's underlying structure — remains intact. This confirms the filter is attenuating unwanted high-frequency noise without discarding the features of interest.
![Low Pass Filter](https://github.com/samueloladosu37/OCT-Image-Generation/blob/main/figures/Low Pass Denoising.jpg)


Top: original signal doped-glass spectrogram, showing broadband noise across the full frequency range. Bottom: filtered signal after low-pass filtering, showing suppressed high-frequency noise with the primary low-frequency content preserved.

---
