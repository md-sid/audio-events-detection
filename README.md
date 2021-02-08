# Audio Events Detection

This work uses Power Spectral Density and Mel-frequency Cepstral coefficients as the main features to classify the MIVIA Audio Events dataset. The dataset contains data of varying SNR, and the system proved to be reliable both in a clean and high-noisy environment.

## Getting Started

MIVIA Audio Events is a public dataset and can be downloaded from [here](https://mivia.unisa.it/datasets/audio-analysis/mivia-audio-events/). Then download all the codes and keep them in the same folder.

Open `suggested_changes.m` and make the necessary changes following the instructions provided in the script. Do not worry about the last part **Trained models** in this script. Any change there is not recommended.
Then run the `main.m` script. This will generate multiple `.mat` files and save those in the directory where you kept the codes.

Now look for "**training_data_and_label.mat**" in the directory which contains a variable named "**new_data**". Use this for classifier learning. After the learning process is complete, save all the learned models with a similar naming format like "**trained_modelname.mat**". If you do not follow this naming convention then you have to go back to the `suggested_changes.m` script and change line 33.

Now run the `predictions.m` script to generate the classification results.
