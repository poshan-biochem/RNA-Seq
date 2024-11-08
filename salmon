#!/bin/bash

# Check if directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <Please provide fastq_directory>"
    exit 1
fi

# Define variables
FASTQ_DIR="$1"                          
INDEX_PATH="$HOME/salmon_sa_index__default/default/" #hg38 transcriptome index 
OUTPUT_DIR="salmon_quant"                
THREADS=12 
CONDA_ENV="RNA-Seq"

# activate conda environemnt
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate $CONDA_ENV                      

# Create main output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Loop through all *_1.fastq.gz files in the specified directory to find sample pairs
for READ1 in ${FASTQ_DIR}/*_1.fastq; do
    # Get the base sample name by removing the _1.fastq.gz suffix
    SAMPLE_NAME=$(basename "$READ1" "_1.fastq")

    # Define path for the corresponding mates
    READ2="${FASTQ_DIR}/${SAMPLE_NAME}_2.fastq"

    # Define the output directory for the sample within the main output directory
    SAMPLE_OUT_DIR="${OUTPUT_DIR}/${SAMPLE_NAME}"

    # Check if both READ1 and READ2 files exist
    if [[ -f "$READ1" && -f "$READ2" ]]; then
        # Create output directory for the sample
        mkdir -p $SAMPLE_OUT_DIR

        # Run Salmon quantification
        salmon quant \
            -i $INDEX_PATH \
            -l A \
            -1 $READ1 \
            -2 $READ2 \
            -p $THREADS \
            -o $SAMPLE_OUT_DIR

        echo "Salmon quantification for $SAMPLE_NAME completed and saved to $SAMPLE_OUT_DIR"
    else
        echo "Skipping $SAMPLE_NAME: missing corresponding _2 file."
    fi
done
