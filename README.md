# Usage
| Script | comments |
| --- | --- |
1. First dump all fastq files into a single directory
2. Execute salmon.sh script to generate counts for each sample. This script automatically recognize corresponding mates for each samples (and replicates) and create a salmon_quant directory containing individual subdirectories for each sample.
./salmon.sh </path/to/fastq/directory>
3. Run tximeta script to import salmon_quant files into R and create a SE object
4. Run DESeq2 script to perform differential gene expression analysis
5. Run Enhanced_Volcano script to create a volcano plot
