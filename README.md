## **Automated Segmentation of Phantom Calibration Rods in Heterogeneous CT Scans using Deep Learning**

ENEN 645 Group 1 Final Project Repo: Automatic binary segmentation of phantom calibration rods in heterogenous Computed Tomography scans

This project uses the nnU-Net v2 framework to implement a deep learning pipeline for the automatic binary segmentation of phantom calibration rods in heterogenous Computed Tomography (CT) scans.  The developed model accurately segments calibration rods despite variability in scanner, acquisition protocol, and imaging artifacts. 

The model was trained with nnU-Net v2 using 60 labelled CT scans (20 knee, 10 chest, 10 abdomen, 20 asynchronous phantom-only) collected from different Scanner vendors (Siemens, GE, Canon), tube energies (80–140 kVp), table heights, and reconstruction kernels.  Default 3D full-resolution nnU-Net v2 preprocessing and data augmentation strategies were implemented to improve model generalizability, including rotation, scaling, Gaussian noise, Gaussian blur, brightness and contrast adjustments, gamma correction, simulation of low-resolution images, and mirroring. A default nnU-Net v2 five-fold cross-validation strategy was used during training, with 80% of scans (48) allocated to training and the remaining 20% (12 scans) reserved for validation in each fold. Manual ground-truth segmentations were prepared using ITK-SNAP (V 4.4.0) by three separate annotators.

Model performance was assessed between ground truth and prediction using the Dice Similarity Coefficient (DSC) and intersection-over-union (IoU) metric. During inference, the model achieved a mean DSC of 0.872 and a mean IoU of 0.781 across 21 unseen scans. Sensitivity and specificity during testing were 0.876 and 0.999, respectively. Sensitivity and specificity should be interpreted with caution as these values are heavily biased due to the imbalance between foreground and background voxels.

The nnU-Net-based model demonstrates strong performance in identifying CT calibration rods with accuracy comparable to manual segmentation. The project provides a scalable alternative to manual segmentation of calibration rods for phantom-based quantitative CT workflows. Documentation outlining the nnU-Net v2 framework can be found on the [nnU-Net v Official GitHub Repository](https://github.com/MIC-DKFZ/nnUNet/tree/master).

