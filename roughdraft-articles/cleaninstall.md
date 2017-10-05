# Starting fresh
I spilled cranberry juice on my computer a few weeks ago; while I was able to recover my hard drive I used the experience to hit the reset button on the tangled web of programs I had installed. In my first few years of grad school I just installed under the philosophy of `JUST MAKE IT WORK NOW` without really knowing anything about package management software. After stumbling in the darkness for a little while I've come across a few really helpful blogs that illustrate what I think is a nice approach to the installation process of programs in general, but certainly there are tradeoffs and features that each user will find helpful and frustrating. Let's just say that this is what I've found works for me, as someone who tends to do work with a bunch of Python as well as a bunch of non-Python programs.  

I started by reading a trio of very helpful blogs by in this order:
- how to [install homebrew](https://www.davidculley.com/installing-software-via-homebrew/)  
- how to [install python](https://www.davidculley.com/installing-python-on-a-mac/) and related packages using [Homebrew](https://brew.sh)  
- how to [install a range of other software](http://tristanpenman.com/blog/posts/2015/10/20/installing-r-and-rstudio-on-mac-os-x/) - like R, R-studio, Spotify, Skype, etc.  

I then attempted to follow their instructions. What I've posted below is largely adapted from those blogs, albeit with a few caveats as things didn't always work exactly as described in those very well documented posts.  

## Part 0 - before installing Homebrew
Software installs get messy - that's why there are lots of package management software available to ease your pain. When I got started I thought the message was "*choose Conda or Homebrew*, but not both", and then realized that the choices could have also included Pip, Fink, and many others. I also didn't understand that Conda is not Python, but Pip is. [This blog](https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/) does a great job differentiating the terminology and focus between package managers vs. distribution. In short, I've found that just about anything I need I can find using Homebrew, and anything I can't I can find using pip. There will come a day where I probably need Conda, but that day hasn't come yet...  

While you can install Homebrew first, you're better off installing the few dependencies that Homebrew wants: Apple's [Xcode software](https://developer.apple.com/xcode/). You can do that a few different ways, but I found the most straightforward way to do it was to navigate to the Mac App store and look for the software - hopefully [this link](https://itunes.apple.com/us/app/xcode/id497799835?mt=12) will point you in the right direction (if not, just search `Xcode` in the App Store). Warning - it's a huge file (about 5Gb at last glance) and will probably take you the longest amount of time to download relative to all the other programs on this post *combined*. Find some coffee or fast internet, or both.  

Once you've downloaded that software the install follows the traditional point and click graphical user interface (GUI) that we're all familiar with. However you're also going to want to **activate the Command Line Tools software** which comes with that download. I followed [this blog](http://railsapps.github.io/xcode-command-line-tools.html) for great info about making sure that (1) my Xcode software was installed properly; and (2) help me walk though the install process of the command line tools. In my case, the entirety of this process amounted to two things:

- 1) Navigate to the Mac App Store and install Xcode software  
- 2) Open up Terminal and type `xcode-select --install` to begin the ~2 minute installation/activation of the **Command Line Tools software**. You can confirm the install is working right - especially that `gcc` is installed properly - by typing `gcc --version` in the Terminal. If that prints something like below, you're ready to install Homebrew:  

```
$ gcc --version
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Apple LLVM version 9.0.0 (clang-900.0.37)
Target: x86_64-apple-darwin17.0.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```

## Part 1 - installing Homebrew
Using [Homebrew](https://brew.sh) saves me loads of time making sure I keep packages in one place (as much as possible anyway). As mentioned above, [this blog](https://www.davidculley.com/installing-software-via-homebrew/) does a terrific job outlining the strategies employed. I've summarized what I did below, but check out that blog for the gory details.  

**install Homebrew**
Staight from their website:  
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

The blog goes on to mention adjusting your `$PATH` variable, which if you understand what that is, you probably don't need that help, and if you *don't* understand what that is, your not going to find that blog all that helpful. So you have two options if you don't know what to do:  
- 1) Change your $PATH, but you might need to create a file first! Just do this:  
  - First, open up Terminal and go to your $HOME directory.  
  - Second, create a `.profile` file  
  - Third, append the $PATH variable like is outlined in the blog.  

Or in other words, do the following using Terminal:  
```
cd $HOME 
nano .profile
```
Then save and close that program with `ctrl+x` and `y`.  
With that saved, you can append the $PATH variable to your `.profile` file as suggested in the blog:  
```
echo export PATH='/usr/local/bin:$PATH' >> ~/.profile
source ~/.profile
echo $PATH
```
You should see something like: `/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/do/.local/bin:/Users/do/bin`.  

 
- 2) Don't do anything. Homebrew will work fine, but you won't be specifying to use Homebrew installed programs over other default-installed programs. Programs like *Python* or *Ruby* will probably use your default-installed versions, rendering a few Homebrew programs useless. However, most of your Homebrew programs will work, provided there isn't a redundant program already installed on your Mac.  

## Part 2 - use Homebrew to install lots of fun stuff
 
