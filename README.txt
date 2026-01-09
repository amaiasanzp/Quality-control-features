This repository contains MATLAB code to compute signal features used to estimate the chest compression (CC) rate during out-of-hospital cardiac arrest (OHCA) from cerebral oximetry signals.
Cerebral oximetry signals are sensitive to multiple noise sources, such as ventilations and sensor motion, which may compromise the reliability of CC rate estimation. To address this issue, the proposed signal processing pipeline includes a signal quality control strategy integrated into the CC rate monitoring algorithm.

The repository is organized as follows:

- main.m
Main script that loads the raw signal, reconstructs the signal using the Stationary Wavelet Transform (SWT), and computes the OHCA-related features.

- SWT.m
Function that performs signal reconstruction based on the Stationary Wavelet Transform.

- computeFeatures.m
Function that computes the set of features used for CC rate estimation.

- Features/
Folder containing one .m file per feature. Each feature function is called from computeFeatures.m.

- SWT/
Folder containing the functions required to compute the Stationary Wavelet Transform. These functions are called from main.m.

Citation
If you use this code in your work, please cite the following paper:
¨A Wavelet based Algorithm for Monitoring Chest Compression Rate during Cardiopulmonary Resuscitation in Cerebral Oximetry Signals¨.
