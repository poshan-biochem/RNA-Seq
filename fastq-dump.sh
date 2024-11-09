#!/bin/bash

# Check if the user provided an input directory and output directory
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory_with_sra_files> <output_directory>"
    exit 1
fi



# Assign input arguments to variables
INPUT_DIR=$1
OUTPUT_DIR=$2
CONDA_ENV="RNA-Seq"

# activate conda environemnt
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate $CONDA_ENV  

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Find and process each .sra file in the input directory
find "$INPUT_DIR" -name "*.sra" | while read -r sra_file; do
    echo "Processing $sra_file..."
    fastq-dump --outdir "$OUTPUT_DIR" --split-files "$sra_file"
done

echo "Processing complete. FASTQ files are saved in $OUTPUT_DIR."
