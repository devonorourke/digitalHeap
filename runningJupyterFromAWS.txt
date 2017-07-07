#go to console.aws.amazon.com
#create amazon account? enter credit card info (we'll keep things free, don't worry)
#download key pair... mov desktop?
    #set up read priviliges for file with "chmod 400 'file.pem'"
#launch instance
#open terminal and enter info to connect to amazon server - see "connect" button at top for details
    #ssh -i "/path/to/key" ubuntu@ec2-52-55-9-183.compute-1.amazonaws.com
    #type yes for the warning message


#update linux OS:
sudo bash
apt-get update
apt-get -y upgrade

#install linux and Python tools:
apt-get -y install tmux git curl gcc make g++ python-dev unzip default-jre python-pip zlib1g-dev subversion libncurses5-dev dh-autoreconf r-base-core


#install python libraries:
sudo apt-get -y install python-serial python-setuptools python-smbus python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose 

#install some more packages to work with Python
sudo apt-get -y install libfreetype6-dev libpng12-dev libjs-mathjax fonts-mathjax libgcrypt11-dev libxft-dev

#install some more?
sudo pip install --upgrade setuptools jupyter virtualenvwrapper cython nose numexpr bottleneck pandas SQLAlchemy pyzmq jinja2 tornado pip

pip install git+https://github.com/dunovank/jupyter-themes.git

#get out of root:
exit

#install jupyter theme
sudo jt -t grade3 -T -N

#password:
ipython
from IPython.lib import passwd
passwd()
    #type: 'thisisonlyatest'
    #get output: 'sha1:c5cbf38edbb9:17873718c4776408f334147aafa946102beb726f'

#create jupyter notebook config profile:
#see here: https://chrisalbon.com/jupyter/run_project_jupyter_on_amazon_ec2.html
#see here too: https://blog.keras.io/running-jupyter-notebooks-on-gpu-on-aws-a-starter-guide.html

jupyter notebook --generate-config
#make certificates for https
mkdir certs
cd certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
    #answer questions

#edit config file:
cd ~/.jupyter/
vi jupyter_notebook_config.py
    #this opens up the file in vim
#insert the following text so that all of this appears before the default text in the config file:
c = get_config()
# Kernel config
c.IPKernelApp.pylab = 'inline'  # if you want plotting support always in your notebook
# Notebook config
c.NotebookApp.certfile = u'/home/ubuntu/certs/mycert.pem' #location of your certificate file
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False  #so that the ipython notebook does not opens up a browser by default
c.NotebookApp.password = u'sha1:c5cbf38edbb9:17873718c4776408f334147aafa946102beb726f'  #the encrypted password we generated in ipython before
# It is a good idea to put it on a known, fixed port
c.NotebookApp.port = 8888
#enter the 'esc' key
#enter the ':' key
#type 'wq!' and hit 'return/enter' key to exit


#go back to your local machine and type:
sudo ssh -i testkey.pem  -L 443:127.0.0.1:8888 ubuntu@ec2-52-55-9-183.compute-1.amazonaws.com

#then from the newly connected instance, type:
ipython notebook
    #this should launch a new jupyter notebook in that terminal window
    # pay attention to the text that is generated in that window - you need to copy the text after the part where it says 'https://localhost:8888/?token={copyallthistext}

#go to a web browswer and type:
https://127.0.0.1
#enter the token/password which appeared above in the {copyallthistext} part

#see here for more help:http://datascienceguide.github.io/how-to-install-the-python-data-science-stack-on-a-remote-server
