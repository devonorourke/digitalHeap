# Starting an AWS instance

## Making an account

## Logging in


## From the terminal
```
## Generic path is:
ssh -i <path.to.pem.file> ubuntu@<the.ec2-with-some-numbers.compute-1.amazonaws.com>
```

### Install necessary packages
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install tmux git curl gcc make g++ python-dev unzip default-jre libssl-dev libcurl4-openssl-dev libssh2-1-dev
sudo apt install python-pip
sudo pip install --upgrade setuptools
sudo pip install biopython natsort pandas numpy matplotlib psutil
sudo pip --no-cache-dir install biom-format
```

If you want to check which version of python you just downloaded, you can always type:
```
python --version
```

### Install dependencies:
A few programs can be installed straight with apt-get command. Note that if you'd prefer to install an updated R version (don't use 'apt-get install r-base r-base-dev' command below - we can install R separately in a moment)
```
sudo apt-get install bedtools vsearch r-base r-base-dev
```

If you want to check the R version you just specified, just type:
```
R --version
```
If you want to control which R version you want installed:
```
sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install r-base r-base-dev
``

#start an R session and install DADA2
R

#in the R session do the following
source("http://bioconductor.org/biocLite.R")
biocLite(suppressUpdates = FALSE)
biocLite("ShortRead", suppressUpdates = FALSE)
biocLite("devtools")
library("devtools")
devtools::install_github("benjjneb/dada2")

#exit R
q()


installation path not writeable, unable to update packages

## copying test files:
rsync devon@pinky.sr.unh.edu:/leo/devon/projects/guano/oro16/p4_data/p4L1/fqRaw/negoro-05A01_CGAGAGTTATCT-ATCGTACG_L001_*.fastq .
rsync devon@pinky.sr.unh.edu:/leo/devon/projects/guano/oro16/p4_data/p4L1/fqRaw/oro16-1135_ACGCTACTATCT-ATCGTACG_L001_*.fastq .
rsync devon@pinky.sr.unh.edu:/leo/devon/projects/guano/oro16/p4_data/p4L1/fqRaw/oro16-1136_ACTCACTGATCT-ATCGTACG_L001_*.fastq .

## running 
