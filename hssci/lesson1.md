# Another install?!?
So recall that in the [introductory lesson](https://github.com/devonorourke/digitalHeap/blob/master/hssci/lesson0.md) we downloaded [Anaconda](https://www.anaconda.com/what-is-anaconda/), which contained [Python](https://www.python.org/about/gettingstarted/) as well as many other unnamed software packages. Basically, we downloaded some soft of Russian nested dolls of software. As mentioned earlier, one other advantage of doing this big installation was that we could quickly manage future downloads of additional software we might want/need. And another reason was that many of those non-Python packages might be useful to us? To get our first lesson rolling we're going to do both of those things: download something we do have ([Jupyter Notebook](http://jupyter.readthedocs.io/en/latest/index.html)) and download something we don't (a program called [chemlab](http://chemlab.readthedocs.io/en/latest/index.html)).  

You might be considering asking the following questions:  
> 1) How many times are we going to be downloading software? Is that all this course is about?
Answer: You will download software routinely. This is not all this course is about.  
> 2) Why do I want Jupyter Notebook?
Answer: Better question! We're using this software because it's a digital notebook which lets you simultaneously write the code you want to perform a function, execute that code within the program, see the output of that code, **AND** let's you separate out all your code, output, and basic note taking into convenient blocks. It does a lot of useful stuff, okay?   
> 3) I don't have any other questions... how do I do this so I can get to lunch?
Answer: See below. And you can eat in lab for all I care.  

# Welcome to your console
Here's the thing - you're going to have to get at least a little bit familiar with a terminal emulator - a.k.a. console. This is the piece of software that will make your parents nod whimsically (or run fearfully). It's the super low-tech-looking (but not actually low tech!) piece of software on every computer that acts as the platform with which you can talk to your computer without clicking anything - just by typing. If you've never used it, it seems really strange. If you have used it before, it seems strangely amazing. However, depending on your OS (Operating System) of choice, you communicate with your console using different languages - in other words, 'speaking' with a Windows machine is executed differently than with a Mac. Here's the basics to consider:  

- Do you have a **Windows machine**? Things are going to be more difficult. In brief: we're going to need to work on this separately before you can move on. I'm going to write all conventions for a Unix OS platform, so it would be best to either [install a Linux distribution directly](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide) if you have Windows 10, or perhaps just install a terminal emulator ([one example here](http://mobaxterm.mobatek.net/)) that contains some Unix-like commands needed to do what we're going to do.  
- Do you have a **Linux machine**? Congrats, you're the weird kid. See instructions for Mac below. But you already knew that.  
- Do you have a Mac machine? Sweet. Do two things:  
  - Click on that *Spotlight* search icon in the top right of your computer and look for a program called `Terminal`. Open that up. Now we can talk to the computer!  

## Terminal - are we there yet? 
A stream of questions that might pop up in your head...  

> Why did I just open up Terminal?  

Because we need to give our computer commands.  

> Fine. How do I give my computer commands?  

By typing things where that blinking cursor sits (called the `command prompt`).  

> But am I using Python right now?  

No. No you are not.  

> Why am I not using Python!?!  

Because you have to tell the computer to use Python.

> Okay, how do I tell the computer to use Python?  

We're getting there.  


So if you're keeping track at home, you've opened up a program that isn't Python so you can use Python...  Why? Because this `Terminal` program is really kind of like an airport terminal - it's the place you go *before* you get to your destination. It can take you anywhere, depending on which plane you want to take off in. In our case, we might be looking for the Python plane. But you might want to jump aboard the [R](https://www.r-project.org/about.html) plane, or [Julia](https://julialang.org/) plane, or any other computer program you want to start communicating with. So the `Terminal` acts as this singular big landing site from which you can start many different journeys.  

It turns out `Terminal` is also a hugely useful piece of software to communicate lots of commands by itself (to keep with the above analogy, Terminal has it's own plane, and the one we're using is called `bash`). Before we get to using Python we're going to use Terminal's native language (`bash`) to do a variety of simple tasks. Just search online for "Terminal basics" and you'll find a million helpful guides [like this one](http://www.cs.virginia.edu/diochnos/tips/terminal/basics.html). In essence, most things you do with a mouse can be done at the command prompt, but many things done with the command line can't be done (at least quickly) with a mouse. Rather than bombard you with many useful (I'd argue essential) command line arguments all at once, we're going to stick to just a very few basics ones:  

## Navigating the command line
You know how when you open a window to look for some file you search through folders within folders within folders? Like how you can have a folder called "My Documents", and within that maybe multiple folders for each class? And how within that class you have perhaps other folders for each unit? And within whatever that unit folder is called you have things like a Word document, pictures, maybe a spreadsheet file, or a movie? Computers simplify this whole thing by boiling down everything into two things: **directories** or **files**. Directories are places where you store things. Files are everything that isn't a directory, which is to say things hold data or programs that can execute functions.  
Why mention all this? Because when you're working within the `Terminal` program, you are essentially "in" one of those folders, and everything you do assumes that, by default, you are trying to do it in that very specific location. You can think of this "folders-in-folders-in-folders" structured as a tree - [see here for an example](http://dsl.org/cookbook/cookbook_8.html). With that tree structure in mind, let's get started moving around... 

First, let's figure out where we are right when we open up the `Terminal` program. Just type:
```
pwd
```
In case it wasn't obvious, you also need to press "return" or "enter" on your keyboard. Notice how the program then exeuctes the command and generates an output? Hopefully it looked something like this:  
```
/Users/devon
```
You'll probably have something slightly different, but a few key features to point out:  
1. Like any tree, we start at the root. Our directory structure - that is, the organization of how all the folders and files are related - starts with a single symbol `/`. This is the *root* directory. One folder *within* that directory - termed a *subdirectory* - is called `Users`. The next subdirectory (the folder within the `Users` folder) is termed `devon`. So what we really have are three levels of folders, going from the parent directory to subsequent subdirectories:  
**root** --> **Users** --> **devon**.  
Organizationally, the output of the `pwd` command showed something termed the **full path**, which is to say, an ordered list of directories (folders) from the most parent (root) directory to whatever your current directory is. In other words, `pwd` really just **P**rints the full path to the **W**orking  **D**irectory.

So `pwd` tells us where we are, but how do we get somewhere else? Because `Terminal` doesn't just show you all the contents of the current folder you are in, you might need to do something like **l**i**s**t them. Try typing:  
```
ls
```
Did you get a print out of several files and folders? By default you won't be able to discriminate which one is a directory and which one is a file (but you can with more information, I promise!). But let's say you knew that you wanted to navigate to the `Documents` folder. What we'd need to do would be to do something like **c**hange **d**irectories... How about:  
```
cd Documents
```
At first glance it doesn't look like anything happened, but did you notice how the command prompt changed? Before you would have seen something like:  
```
Devons-MacBook-Air:~ devon$
```
But now it is extended to:  
```
Devons-MacBook-Air:Documents devon
```
What's the difference? We moved into the `Documents` directory, and our command prompt indicates just that! You could always `ls` to check and see what the contents are in your current directory (assuming you know what's in the directory to begin with), but perhaps the simplest thing to do would be to use the `pwd` command to confirm that your Terminal program things you are where you are. Like so:  
```
pwd
/Users/do/Documents
```
This gives the impression that you can only move one level up at a time. Not quite - you can also move back one level with a shorthand command:  
```
cd ..
```
Notice how you're back to the parent directory of `Documents`? Just check with `pwd` and you'll notice that your full path should say something like `/Users/{your.name}`... note "your.name" is generic. Cool - so we can advance up or down one level with the `cd` function, but it turns out we can use the `cd` command to jump to whatever directory you want to, provided you enter the **full path** of the intended destination. Here's an example; let's say I want to go to a folder that has the following path: `/Users/devon/Documents/Chemistry/Unit1`, and let's assume I started from `/Users/devon`. You might think the thing I'd need to do is:
```
cd Documents
cd Chemistry
cd Unit1
```
And, well, that would work, but that would be dumb if you knew where you were going. Instead, assuming you started in `/Users/devon`, you can get there in one step: 
```
cd Documents/Chemistry/Unit1
```
Interesting note - there's a sort of default "just get me home" command which will always take you back to whatever "home" your system has defined (by you if you want to): `cd`. In the default case that's `/Users/{your.name}`. So if you happened to be in a way, way out subdirectory (like `/Users/devon/Documents/Chemistry/Unit1`) you could navigate back the slow way:
```
cd ..
cd ..
cd ..
```
Or more quickly, assuming you started from `/Users/devon/Documents/Chemistry/Unit1`, just type:
```
cd
```

Great, so that's how you move about. With that in mind, navigate to your `Documents` directory. Now we're going to learn one more `bash` program for the time being (all these commands like `cd`, `pwd` and `ls` are programs): `mkdir`. Any guess what that means? **M**a**k**e **dir**ectory - that is, we're going to make a folder.  

Here's the thing to try: open up the Finder icon on your screen with your mouse and click on the `Documents` folder to open it. Move the `Terminal` window and Finder windows into positions next to each other so you can see both at once.  Now move back to `Terminal` and assuming your at the `../Documents` directory, type:
```
mkdir chem_lessons
## you type that "_" symbol with holding down the "shift" button and then hitting the 'minus' symbol next to the 'zero' key
```
Notice how a new folder named "chem_lessons" magically appeared? Well not magic - you told the computer to create a directory named that in that place - so the computer is just doing what it's told. And that's the whole point!  

# Are we there yet?
Now that you know how to use an execute `cd`, `ls`, `pwd`, and `mkdir` we can go about the business of executing the last (and most important) step of today's work: downloading the `rdkit` program. Like before, we're conducting this business within `Terminal`, and like before, we're going to start in our home directory. I'm going to show you three different ways to do the same thing to get back to that spot (you only need to do one of the following):  
```
cd          # super basic, super fast
cd $HOME    # oohhh, what's that fancy environmental variable thing?
cd ~        # it's called a tilda in case you were wondering, and it's how you often define the path for your home directory
```
Remember you can check you're in the right spot with `pwd`.  

Let's now use `Anaconda's` software to execute a specific task: download another piece of software ([chemlab](http://chemlab.readthedocs.io/en/latest/installation.html). In one remarkably simple line of code, this will:  
a) download the most recent version of the tool
b) download any dependent programs this tool requires that you might not have
c) perform version-compatibility among those various programs to make sure nothing breaks
d) put it in a place on your computer where it will work seamlessly so you can call it up from any position on the command line. 

```
http://chemlab.readthedocs.io/en/latest/installation.html
```
That's it. Didn't I tell you Anaconda was awesome?  


# Finally - really - to Jupyter Notebook!
The last thing we'll to today is call the `Juptyer Notebook` program up (now that you know how to move about the command line!). It's really simple:
```
jupyter notebook
```

You'll notice that this should do two things: open up a web browser, and generate a messsage in your `Terminal`. If what you see on the `Terminal` screen is...
```
-bash: jupyter: command not found
```
... well we've got problems. See you after class!  

However, if what you see in `Terminal` is something like this, then you're good to go:
```
[I 06:36:55.302 NotebookApp] Writing notebook server cookie secret to /Users/do/Library/Jupyter/runtime/notebook_cookie_secret
[I 06:36:55.356 NotebookApp] Serving notebooks from local directory: /Users/do
[I 06:36:55.356 NotebookApp] 0 active kernels
[I 06:36:55.356 NotebookApp] The Jupyter Notebook is running at:
[I 06:36:55.357 NotebookApp] http://localhost:8888/?token=1c1f8b0a540fd398f1c434635ffaa01b76a6ddb654185beb
[I 06:36:55.357 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 06:36:55.358 NotebookApp]
```

This new web page is called the *Notebook Dashboard*, you should see a pretty basic layout like the image below. Essentially you open up a web page that functions like a Finder window - you can open up existing folders, create (a few kinds of) new files and folders, and a few other things we'll get into later. **Important**: the directory you **launch** `Jupyter Notebook` from is the directory that this web page starts from.  
<img src="https://raw.githubusercontent.com/devonorourke/digitalHeap/master/hssci/jupNotopen.jpg" />  


> So is this Juypter Notebook?  
No.  
> What?!~! 
Patience. Almost there. Read below.  

## Creating a new notebook:
See [this link](http://jupyter-notebook.readthedocs.io/en/latest/examples/Notebook/Notebook%20Basics.html) for a great amount of information about the basic functionality of `Jupyter`. The following instructions are derived from that link. If you are a visual person who likes things in motion see [this .gif](https://media.giphy.com/media/FrAeFjLPOvT8I/giphy.gif) to figure out what to click. 

From the *Notebook Dashboard*, click the `New` icon in the top right corner of the browser, then select `Python3` from the few options (it's the only Notebook option, but there are also simple files like `text file`, `folder`, and `terminal` you could select - this is another way you can create a new folder/file within `Jupyter`). Once you click on `Python3` a new window should open - your first Jupyter Notebook!  





