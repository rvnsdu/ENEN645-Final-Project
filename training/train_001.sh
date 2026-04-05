#!/bin/bash

# Get the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Configuration
DATASET=001
PREPROCESS=false
MODEL=3d_fullres
FOLDS="0 1 2 3 4"
TRAINER=nnUNetTrainerNoMirroring
GPU_ID=0  # Set default GPU ID (change to match your system)

# Set environment variables relative to script location
export nnUNet_compile=0
export nnUNet_raw="$DIR/nnUNet_raw"
export nnUNet_results="$DIR/nnUNet_results"
export nnUNet_preprocessed="$DIR/nnUNet_preprocessed"
export nnUNet_def_n_proc=12

# Preprocessing
if [ "$PREPROCESS" = true ]; then
    nnUNetv2_plan_and_preprocess -d $DATASET -c $MODEL --verify_dataset_integrity
fi

# Training loop with GPU specification
for FOLD in $FOLDS; do
    CUDA_VISIBLE_DEVICES=$GPU_ID nnUNetv2_train $DATASET $MODEL $FOLD -tr $TRAINER --c
done

