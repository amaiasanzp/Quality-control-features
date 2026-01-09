Code to compute the features to calculate the rate of CCs during OHCA.

This repository is structured in the following way:

The main script (main.m) loads raw signal, calculates the reconstructed signal based on the Stationary Wavelet Transform (SWT) (compute_SWT.m) and computes the OHCA features (computeFeatures.m).
The features folder contains a .m file to each feature, which are called from computeFeatures.m.
The SWT folder contains the functions needed to compute the Stationary Wavelet transform and is called from main.m.

If you use this code on your work please cite the following paper, thank you.

¨A Wavelet based Algorithm for Monitoring Chest Compression Rate during Cardiopulmonary Resuscitation in Cerebral Oximetry Signals¨.