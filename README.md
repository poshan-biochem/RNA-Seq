# Usage
| Step | Script | Comments |
| --- | --- | --- |
| 1 | [fastq-dump.sh](https://github.com/poshan-biochem/RNA-Seq/blob/main/fastq-dump.sh) | Dump all fastq files into a single directory |
| 2 | [salmon.sh](https://github.com/poshan-biochem/RNA-Seq/blob/main/salmon.sh)| Execute salmon.sh script to generate counts for each sample. This script automatically recognize corresponding mates for each samples (and replicates) and create a salmon_quant directory containing individual subdirectories for each sample. |
| 3 | [tximeta.R](https://github.com/poshan-biochem/RNA-Seq/blob/main/tximeta.R)| Run tximeta script to import salmon_quant files into R and create a SE object |
