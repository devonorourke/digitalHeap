# Starting an AWS instance

## Making an account

## Logging in


## From the terminal
```
## Generic path is:
ssh -i <path.to.pem.file> ubuntu@<the.ec2-with-some-numbers.compute-1.amazonaws.com>
```

# Package installation
## Basic infrastracture
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install tmux git curl gcc make g++ python-dev unzip default-jre libssl-dev libcurl4-openssl-dev libssh2-1-dev
sudo apt install python-pip
sudo pip install --upgrade setuptools
sudo pip install biopython natsort pandas numpy matplotlib psutil edlib
sudo pip --no-cache-dir install biom-format
```

If you want to check which version of python you just downloaded, you can always type:
```
python --version
```

## Additional dependencies:
A few programs can be installed straight with apt-get command. I've found that installing R directly using this command leads to a series of compatability problems which... well it's a long story, and suffice it to say, you don't want to install R this way. We're going to install an updated R version (don't use 'apt-get install r-base r-base-dev' command below - we can install R separately in a moment)
```
sudo apt-get install bedtools
```
And now install vsearch:
```
cd $HOME/pkgs
wget https://github.com/torognes/vsearch/archive/v2.4.3.tar.gz
tar xzf v2.4.3.tar.gz
cd vsearch-2.4.3
./autogen.sh
./configure
make
sudo make install
```

Now install a specific (and updated) version of R using apt-get, but by specifying the source list first:
```
sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install r-base r-base-dev
```

If you want to check the R version you just specified, just type:
```
R --version
```
It should be >= 3.4.  

Make sure that you have permission to install programs directly to the proper folder where R packages go. See [this thread](https://stackoverflow.com/questions/32540919/library-is-not-writable) for an indication of why things might give you headaches:
```
cd /usr/local/lib/R
sudo chmod o+w site-library
```

We can install all our needed R packages within R. To do that, start an R session:
```
R
```

Then execute the following commands to install all the needed packages:
```
source("http://bioconductor.org/biocLite.R")
biocLite(suppressUpdates = FALSE)
biocLite("ShortRead", suppressUpdates = FALSE)
biocLite("devtools")
library("devtools")
devtools::install_github("benjjneb/dada2")
```
exit R
```
q()
```


In case you're wondering which versions and which packages are installed, check out a few helpful commands [at this site](https://stackoverflow.com/questions/11103189/how-to-find-out-which-package-version-is-loaded-in-r).  



Install usearch
```
cd $HOME
mkdir bin
cd bin
wget https://github.com/devonorourke/digitalHeap/raw/master/usearch9
chmod +x usearch9
```

Install amptk
```
cd $HOME/
mkdir pkgs
cd pkgs
git clone https://github.com/nextgenusfs/amptk.git
ln -s /home/ubuntu/pkgs/amptk/amptk /home/ubuntu/bin
```


## copying test files:
```
cd $HOME
mkdir test_data
cd test_data
rsync devon@pinky.sr.unh.edu:/leo/devon/projects/guano/oro16/p4_data/p4L1/fqRaw/negoro-05A01_CGAGAGTTATCT-ATCGTACG_L001_*.fastq .
rsync devon@pinky.sr.unh.edu:/leo/devon/projects/guano/oro16/p4_data/p4L1/fqRaw/oro16-1135_ACGCTACTATCT-ATCGTACG_L001_*.fastq .
rsync devon@pinky.sr.unh.edu:/leo/devon/projects/guano/oro16/p4_data/p4L1/fqRaw/oro16-1136_ACTCACTGATCT-ATCGTACG_L001_*.fastq .
```

# running AMPtk
```
## Install preformatted COI databases:
amptk install -i COI

## run Illumina adapter trimming
amptk illumina \
-i /home/ubuntu/test_data \
-o P4L1test \
--rescue_forward on \
--require_primer off \
--min_len 160 \
--full_length \
--cpus 12 \
--read_length 250 \
-f GGTCAACAAATCATAAAGATATTGG \
-r GGWACTAATCAATTTCCAAATCC

## run dada2
amptk dada2 \
--fastq P4L1test.demux.fq \
--out oro16L1 \
--length 180 \
--platform illumina \
--uchime_ref COI
```
It worked!
