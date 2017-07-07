# What are we doing?
Going to install a website using existing Github account. We assume that the only thing you've completed to this point is installed a Github account. Instructions hereafter are for using my account, "devonorourke", at github.com/devonorourke.  

## Installation of programs

Note that if you have a Windows machine running, you'll have to see here for additional installation measures: https://jekyllrb.com/docs/windows/

### Jekyll
First, we installed all dependencies for Jekyll. See Jekyll's requirements at https://jekyllrb.com/docs/installation/#requirements.  

I already had **gcc** and **make** installed. You can check with the following commands using the terminal:  

`gcc -v`
`ruby -v`  
`make -v`  

I needed to install **RubyGems** with the following command:  
`gem update --system`  

You can then install Jekyll and Bundler gems through RubyGems:  
`gem install jekyll bundler`  

## Executing jekyll commands:
We're going to start a new site called **myblog** following the install instructions from Jekyll's site here: https://jekyllrb.com/docs/quickstart/  

Create a new directory to store all the info:  
`mkdir /Users/devonorourke/Documents/jekyllSites`

Then move into that directory and execute the command to build the new site:  
`cd jekyllSites1`  
`jekyll new myblog`  

Change into the new directory **./myblog/** and build the site on the preview server:  
`cd myblog`  
`bundle exec jekyll serve`  

You should see a message stating that the server is running. Go to the server address by opening up a new web browser and pasting the url (probably **http://127.0.0.1:4000/**.  

You can always detach from this server if you want to stop the process with:  
`jekyll serve --detach`


**in _config.yml**
> - update line33 for avatar: "img/avatar-icon.png"
> - either a new path to the file for icon, or update the icon in /img/...  

**followed instructions [here](http://deanattali.com/beautiful-jekyll/)**
**changed several things in the '_config.yml' file**
> - line 7: changed to my websited address: "devonorourke.github.io"
> - line 17: changed name of website title to "making mountains out of molehills"
> - line 20: changed short description of website
> - line 25: changed naviation bar addresses. didn't want drop down format so removed dashes.
> - line 33: kept avatar path to icon, but need to address later
> - line 44: changed some of the parameters for authorship names (added github, twitter and Linkedin addresses)
> - line 60: changed the true/false statements to correct for what i entered in lines44 above
> - line 78: made changes to defaults to reflect changes in line 60 above.

**review differences between 'posts' and 'pages'**
**review syntax behind front matter in 'posts'**

get going!
