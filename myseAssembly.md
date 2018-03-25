# MYSE genome project

## collection history

## extraction history

## sequencing history

## scripts
All scripts stored in github repo. Used SLURM job submission.

## assembly
See **Supplementary instructions** for installation information.  

### program versions
- fastqc, FastQC v0.11.5
- trimmomatic
- discovar
See [this (unaffiliated) report](https://banana-slug.soe.ucsc.edu/_media/team_5_report_1.pdf) for extensive documentation about the workflow
- [jemalloc](http://jemalloc.net/) v5.0.1
- FastUniq, v1.1

### workflow PART-1: quality control
1. Ran `fastqc` - minimal read through for most data though R2 reads look slightly lower in quality; fraction of reads where we're getting adapter read through is around 170-180 bp, so even most of those reads are going to produce useable fragments.  

### workflow PART-2: read prep  
2. Adapter and quality trimming with `Trimmomatic`. Input **178,126,863** read pairs. Output consisted of **123,476,150** read pairs both surviving _(69.32 %)_; **46,469,782** forward only reads surviving _(26.09 %)_; and **3,227,782** reverse only reads surviving _(1.81%)_. This process removed **49,53,149** reads from the dataset _(2.78%)_ in total.  

#### optional ideas:
After discovering this [review post](https://banana-slug.soe.ucsc.edu/_media/team_5_report_1.pdf) it seemed worthwhile exploring whether we could improve assembly quality by removing duplicate reads, and converting the resulting .fastq files to .bam file types.  

The FastUniq program removes duplicate reads without reference mapping as [described in their paper](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0052249). See [supplementary instructions](#supplementary-instructions). Unfortunately it doesn't accept zipped files, so we have to unzip the trimmed .fq.gz files first, then zip the output up again. Another program, [Super-Deduper](http://dstreett.github.io/Super-Deduper/) does accept .gz files so I installed that too. As they describe in [their paper](https://dl.acm.org/citation.cfm?id=2811568&dl=ACM&coll=DL) which compares their program against other duplicate removal programs (including FastUniq), this program doesn't require full length duplicates to be removed so it's a bit more aggressive than FastUniq in what is deduplicated.


### workflow PART-3: assembly


3. Discovar de novo assembly  
A few partiuclar settings attempted:  
**For v0.1**:  
- Specified the trimmed reads (though their manual suggests using untrimmed reads)  
- Specified a memory allocation of 500 Gb in SLURM script (but not the Discovar command itself; that was left to the default parameter to vary freely)  
- Specified 24 threads in the SLURM script and specified the same number of threads in the Discovar command also  


# Supplementary instructions

## Installation info
Installation of programs was only partially complete at time of beginning the project on our computer cluster. Programs that required further installation are described below.

I used a virtual environment created via Conda (and Python3.6).  
```
module purge
module load anaconda/colsa
source activate Py3.6
```

### PCR duplicate removal
Two options here:
**FastUniq**
```
cd $HOME/pkgs
wget https://downloads.sourceforge.net/project/fastuniq/FastUniq-1.1.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Ffastuniq%2Ffiles%2FFastUniq-1.1.tar.gz%2Fdownload&ts=1521940630
mv FastUniq-1.1.tar.gz\?r\=https\:%2F%2Fsourceforge.net%2Fprojects%2Ffastuniq%2Ffiles%2FFastUniq-1.1.tar.gz%2Fdownload FastUniq-1.1.tar.gz
tar xvzf FastUniq-1.1.tar.gz
rm FastUniq-1.1.tar.gz\?r\=https\:%2F%2Fsourceforge.net%2Fprojects%2Ffastuniq%2Ffiles%2FFastUniq-1.1.tar.gz%2Fdownload FastUniq-1.1.tar.gz
cd FastUniq/source
make
cd $HOME/bin
ln -s /mnt/lustre/macmaneslab/devon/pkgs/FastUniq/source/fastuniq .
```

Or **SuperDeduper**
```
cd $HOME/pkgs
git clone https://github.com/dstreett/Super-Deduper.git
cd Super-Deduper
make
cd $HOME/bin
ln -s /mnt/lustre/macmaneslab/devon/pkgs/Super-Deduper/super_deduper .
```

### picard
Downloaded from [source](https://github.com/broadinstitute/picard/releases/tag/2.18.0)  
```
wget https://github.com/broadinstitute/picard/archive/2.18.0.zip
unzip 2.18.0.zip
rm 2.18.0.tar.gz
cd picard-2.18.0

```

### jemalloc
I went to the [jemalloc release page](https://github.com/jemalloc/jemalloc/releases) and used their most recent version at the time:
```
cd $HOME/pkgs
wget https://github.com/jemalloc/jemalloc/releases/download/5.0.1/jemalloc-5.0.1.tar.bz2
tar xvjf jemalloc-5.0.1.tar.bz2
rm jemalloc-5.0.1.tar.bz2
cd jemalloc-5.0.1
./configure --prefix=$HOME/bin
make
make install
```

### discovar
See [their website](https://software.broadinstitute.org/software/discovar/blog/?page_id=98) for further details; note some links appear to be broken.

> Note my GCC compiler within the `Py3.6` virtual environment was ` 4.8.5 20150623 (Red Hat 4.8.5-11)`. I point this out because the program will not compile with GCC 5 (or greater probably).

```
cd $HOME/pkgs
wget ftp://ftp.broadinstitute.org/pub/crd/DiscovarDeNovo/latest_source_code/LATEST_VERSION.tar.gz
tar xvzf LATEST_VERSION.tar.gz
cd discovardenovo-52488/
./configure --prefix=$HOME --with-jemalloc=/mnt/lustre/macmaneslab/devon/bin/lib
make
make install
```



## scratch for scripts


... fastuniq
```
/mnt/lustre/macmaneslab/devon/batgenomes/fq/trim
gzip -d
gunzip sample.fastq | fastuniq | gzip -c > uniq.fastq.gz
```

... super_deduper
```
READSDIR=/mnt/lustre/macmaneslab/devon/batgenomes/fq/trim
super_deduper -1 $READS/myseTisb_R1.fq.gz -2 $READS/myseTisb_R2.fq.gz \
--output-prefix dedupd \
--gzip-output
```

script using tiny subsample of reads for ddnovo run
```
#!/bin/bash

#SBATCH -D /mnt/lustre/macmaneslab/devon/batgenomes/reads/fqtrim/tinysamp
#SBATCH --partition=macmanes,shared
#SBATCH --job-name="tinyDDNovo"
#SBATCH --output=tinyDDNovo-v1.log
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem 500Gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=devon.orourke@gmail.com


module purge
module load anaconda/colsa
source activate py3.6
PATH=/mnt/lustre/macmaneslab/devon/bin:$PATH

srun echo "      /\^._.^/\     starting process: `date`"

READSDIR=/mnt/lustre/macmaneslab/devon/batgenomes/reads/fqtrim/tinysamp

DiscovarDeNovo \
READS=$READSDIR/*.fq \
OUT_DIR=./tiny-v1 \
NUM_THREADS=24

echo "      /\^._.^/\     ending process: `date`"
```

Subsample the reads to test DDnovo:
We'll do this for ~ 1% of the reads...
```
#!/bin/bash

#SBATCH -D /mnt/lustre/macmaneslab/devon/batgenomes/reads/fqtrim
#SBATCH -p shared,macmanes
#SBATCH --job-name="subsetReads"
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --output=subsetReads.log

module purge
module load linuxbrew/colsa
PATH=/mnt/lustre/macmaneslab/devon/bin:$PATH

srun echo "      /\^._.^/\     starting process: `date`"

seqtk sample -s100 myseTisb_R1.fq.gz 120000 > sub1.fq
seqtk sample -s100 myseTisb_R2.fq.gz 120000 > sub2.fq

echo "      /\^._.^/\     ending process: `date`"
```

## fastq to sam to bam files
partial (incomplete!) script to convert fastq to unsorted .bam file:
note our trimmed reads have different numbers of reads (thus there are orphaned reads as well as paired reads, and they are not necessarily in order if paired). After read trimming (and concatenating paired and unpaired read data), we have **169,945,932** forward reads, but just **126,703,932** reverse reads.  
```
#!/bin/bash

#SBATCH -D /mnt/lustre/macmaneslab/devon/batgenomes/reads/bams
#SBATCH -p shared,macmanes
#SBATCH --job-name="fq2bam"
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --output=fastq2bam.log

## Define path variables for programs used in script:
BWA=/mnt/lustre/macmaneslab/devon/bin/bwa
SAMTOOLS=/mnt/lustre/macmaneslab/devon/bin/samtools
PICARD=/mnt/lustre/software/linuxbrew/colsa-orig/Cellar/picard-tools/2.9.0/share/java/picard.jar
FASTQ1=/mnt/lustre/macmaneslab/devon/batgenomes/reads/fqtrim/myseTisb_R1.fq.gz
FASTQ2=/mnt/lustre/macmaneslab/devon/batgenomes/reads/fqtrim/myseTisb_R2.fq.gz

# Convert fastq file to sam file

srun java -Xmx8G -jar $PICARD FastqToSam \
    FASTQ=$FASTQ1 \ #first read file of pair
    FASTQ2=$FASTQ2 \ #second read file of pair
    OUTPUT=myseTisb_u.bam \
    READ_GROUP_NAME=HCGFCBCX2 \ #required; changed from default of A
    SAMPLE_NAME=myseTisb \ #required
    LIBRARY_NAME=Hiseq-733 \ #required
    PLATFORM=illumina \ #recommended
    SEQUENCING_CENTER=NovogeneCN \
    RUN_DATE=2018-03-10
```


## ddnovo notes
- v0.1r = raw reads; `NUM_THREADS=24` specified in ddnovo; `--cpus-per-task` set to 24 on SLURM; no `--mem` in SLURM specified
- v0.1c = trim reads; `NUM_THREADS=24` specified in ddnovo; `--cpus-per-task` set to 24 on SLURM; `--mem 500Gb` specified in SLURM
