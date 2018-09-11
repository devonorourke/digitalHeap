# getting started with Digital ocean
- step 1: made an account using Google account; entered credit card info
- step 2: obtained tiny droplet, set it up from server in NY, tried to figure out how to do the SSH key thing.
- longer step 2: The not too obvious stuff...
```
DevonOs-MacBook-Air:ssh_keys do$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/do/.ssh/id_rsa): /Users/do/.ssh/id_rsa2
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /Users/do/.ssh/id_rsa2.
Your public key has been saved in /Users/do/.ssh/id_rsa2.pub.
```

1. Start by typing `ssh-keygen -t rsa`. When it asks you where to save the file, note you might have already done this for another `rsa` key, so you need to name it something else (I named this one `rsa2` instead of just `rsa`).

2. Enter (and re-enter) a passphrase if you want (or not). I didn't. I forget things.

3. Notice that you've created a .rsa key as `id_rsa2`, but that isn't what you need to copy and paste. What you want to copy and paste are the entirety of the contents in `id_rsa2.pub`. Copy that information and then paste that into the SSH key generator in the Digital Ocean setup.

4. Create a host name (my first one is `ubuntu-v1-orourke`) then create the droplet.
---

A big problem with my Mac: it would refuse to recognize Port 22... I kept getting this error:
```
ssh: connect to host xx.xxx.xxx.xxx port 22: Connection refused
```

Within terminal, I needed to type this to resolve it:
```
sudo systemsetup -getremotelogin
```

Then I logged in:
```
ssh root@xxx.xxx.xx.xx
```

(example with and without SSH keys ... if you didn't create a Droplet with SSH, you get an email; if you set it up ahead of time, then you just log right in)

Let's change the default `root` user to our name:

```
adduser devon
```
Then enter your password you used when setting up the Droplet ... Now set it up:
```
usermod -aG sudo devon
su - devon
```

## Installs:
Followed these instructions: https://www.digitalocean.com/community/tutorials/how-to-install-r-on-ubuntu-16-04-2


1. Set up R:
```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo apt-get update
sudo apt-get install r-base
```

2. Set up Nginx:
```
sudo apt-get install nginx
sudo ufw allow 'Nginx Full'
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
```
Copy and paste the first line (the IP address) into your web broswer of choice. You should see the image illustrated from the tutorial here: https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-16-04


3. Set up custom Domain name...
This is involved. For now I just used my `sciencedork.club` domain instead of the wordpress account. Hopefully this will work...

4. Install Shiny
Per the Digital Ocean instructions, make sure you update the `shyiny-server-...` version. Go to this link: https://www.rstudio.com/products/shiny/download-server/ and follow their instructions (which are probably already updated at time of reading this post):
```
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.7.907-amd64.deb
```
Note that the next instruction is dependent upon the version of the `shiny-server-...` you just installed. Don't blindly copy and paste - enter your specific version to match:
```
md5sum shiny-server-1.5.7.907-amd64.deb
```

Now we can keep installs rolling; again, note I'm modifying from Digital Ocean's specific versions for the `shiny-server` and posting my more updated version from what they've installed by example:
```
sudo apt-get install gdebi-core
sudo gdebi shiny-server-1.5.7.907-amd64.deb
```
If successful, the output should look something like this:
```
Created symlink from /etc/systemd/system/multi-user.target.wants/shiny-server.service to /etc/systemd/system/shiny-server.service.
● shiny-server.service - ShinyServer
   Loaded: loaded (/etc/systemd/system/shiny-server.service; enabled; vendor preset: enabled)
   Active: active (running) since Sun 2018-06-10 19:53:51 UTC; 48ms ago
 Main PID: 28595 (shiny-server)
    Tasks: 6
   Memory: 3.0M
      CPU: 16ms
   CGroup: /system.slice/shiny-server.service
           └─28595 /opt/shiny-server/ext/node/bin/shiny-server /opt/shiny-server/lib/main.js
```           

Two more things to make sure everything's kosher:
```
## confirms that you can listen to the port you need to listen to:
sudo netstat -plunt | grep -i shiny

## modify's firewall access to use shiny server
sudo ufw allow 3838
```
