# Using `pybold` to obtain BOLD records
See their [github page](https://github.com/AAFC-MBB/pybold) for install details.

# Install
I installed on my local machine as a first test; I created a virtual environment for Python2.7.14, then installed using their `pip` instructions. Because I am using Homebrew as a package manager, my python binaries are in a different place from a default install.

```
cd $HOME
virtualenv py27.14 -p /usr/local/Cellar/python/2.7.14/bin/python2.7
source py27.14/bin/activate
pip install pybold
```

# usage
There's an error in their example online - you have to change `taxons` to `taxon`. See the commented line:

```
import pybold.specimen

taxons_list = ['Achaeorhizomycetes', 'Arthoniomycetes']
sc = pybold.specimen.SpecimensClient()

## here's their error - note their example uses "...sc.get(taxons = ..." but you want just "...sc.get(taxon = ..."
specimen_list = sc.get(taxon='|'.join(taxons_list))


for specimen in specimen_list:
print specimen.process_id
```
