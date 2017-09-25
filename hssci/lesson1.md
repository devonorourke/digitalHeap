# Another install?!?
So recall that in the [introductory lesson](https://github.com/devonorourke/digitalHeap/blob/master/hssci/lesson0.md) we downloaded [Anaconda](https://www.anaconda.com/what-is-anaconda/), which contained [Python](https://www.python.org/about/gettingstarted/) as well as many other unnamed software packages. Basically, we downloaded some soft of nested dolls of software. As mentioned earlier, one other advantage of doing this big installation was that we could quickly manage future downloads of additional software we might want/need. And another reason was that many of those non-Python packages might be useful to us - both those installed with Anaconda as well as yet to be downloaded programs. To get our first lesson rolling we're going to do all of those things: start using base functions you've already downloaded, start using some programs you've downloaded but need to import (ex. [Jupyter Notebook](http://jupyter.readthedocs.io/en/latest/index.html)) and download something we don't (a program called [nglview](https://github.com/arose/nglview)).  

You might be considering asking the following questions:  
> 1) How many times are we going to be downloading software? Is that all this course is about?  

Answer: You will download software routinely. This is not all this course is about.  

> 2) Why do I want Jupyter Notebook?  

Answer: Better question! We're using this software because it's a digital notebook which lets you simultaneously write the code you want to perform a function, execute that code within the program, see the output of that code, **AND** let's you separate out all your code, output, and basic note taking into convenient blocks. It does a lot of useful stuff, okay?   

> 3) I don't have any other questions... how do I do this so I can get to lunch?  

Answer: See below. And you can eat in lab for all I care.  

# Welcome to your console
Here's the thing - you're going to have to get at least a little bit familiar with a terminal emulator - a.k.a. console. This is the piece of software that will make your parents nod whimsically (or run fearfully). It's the super low-tech-looking (but not actually low tech!) piece of software on every computer that acts as the platform which you communicate directly to your computer without clicking anything - just by typing. If you've never used it, it seems really strange. If you have used it before, it seems strangely amazing. However, depending on your OS (Operating System) of choice, you communicate with your console using different languages - in other words, 'speaking' with a Windows machine is executed differently than with a Mac. Here's the basics to consider:  

- Do you have a **Windows machine**? Things are going to be more difficult. In brief: we're going to need to work on this separately before you can move on. I'm going to write all conventions for a Unix OS platform, so it would be best to either [install a Linux distribution directly](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide) if you have Windows 10, or perhaps just install a terminal emulator ([one example here](http://mobaxterm.mobatek.net/)) that contains some Unix-like commands needed to do what we're going to do.  
- Do you have a **Linux machine**? Congrats, you're the weird kid. See instructions for Mac below. But you already knew that.  
- Do you have a Mac machine? Sweet. Do two things:  
  - Click on that *Spotlight* search icon in the top right of your computer and look for a program called `Terminal`. Open that up. Now we can talk to the computer!  

# Terminal - are we there yet? 
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

# Navigating the command line
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

# Are we there yet? Using Jupyter Notebook
Now that you know how to use an execute `cd`, `ls`, `pwd`, and `mkdir` we can go about the business of executing the main point of today's work: using `Jupyter Notebook`. It's really simple:
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

No, not really.  

> What?!~!  

Patience. You're just one click away! This page is just the spot you can *create* a new notebook from - see below.

## Creating a new notebook
See [this link](http://jupyter-notebook.readthedocs.io/en/latest/examples/Notebook/Notebook%20Basics.html) for helpful documentation (ie. information about how to use the program) about the basic functionality of `Jupyter`. From the *Notebook Dashboard*, click the `New` icon in the top right corner of the browser, then select `Python3` from the few options (it's the only Notebook option, but there are also simple files like `text file`, `folder`, and `terminal` you could select - this is another way you can create a new folder/file within `Jupyter`). Once you click on `Python3` a new window should open - your first Jupyter Notebook!  You can then name this notebook whatever you like - I'm going to call it "**lesson1**".  

In movie form, just do this (I didn't make this movie, so they name it "*My New Notebook*" instead of calling it "*lesson1*"):  

<img src="https://media.giphy.com/media/FrAeFjLPOvT8I/giphy.gif" />  

Before you get too excited (I hope you're excited!) click on the web browser tab that you first opened when you launched `Jupyter` - that's your *Notebook Dashboard* tab (it's the tab titled **Home**). Notice anything that changed? You should see a little green icon that looks like a notebook on the screen with the name of your new notebook. You'll notice that it's running, which just means that the notebook is open and ready to be used. As you create more and more notebooks you'll find this green/gray icon coloring useful to figure out which notebooks are currently running (ie. active) or not.  

Okay, switch back to your new notebook, titled **lesson1**.  

## Basic notebook functionality - it's all about the *cell* type
At this point Jupyter Notebook might not look that interesting or powerful, but just you wait. There is a simplicity to it's functionality though. In essence, you create a notebook by adding new pieces called **cells**. There are a few different *kinds* of cells; while you can type anything you want in any cell type, the behavior of whatever you type depends on the kind of cell you're working with. You can change the type of cell by  
1) **Code** - The default cell. Anything you type in this **cell** type will assume you are speaking in Python's lauguage. This is where the magic happens. More on this in a minute.  
2) **Markdown** - Use this when you want to type textual/explanatory information, not code. It's called a *Markdown* cell type because it uses a syntax (think "way of speaking") that has a few tweaks. That is, it has it's own language, but it's super-duper straightforward and is worth your effort in learning. See [this cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) that will help explain how to use Markdown. If you have this idea, you can always use the next cell type - Raw NBconvert.
3) **Raw NBConvert** - As simple as it gets. This cell type just prints whatever you type into it. For example, if you have an elegant code you want to execute but have selected the current cell to be this kind of cell, you'll just print out the text again - nothing will happen. Why use it? Some times it's nice to just have the output of something stripped down to basic text. Some times you don't want to use Markdown to write some sort of explanatory text. You'll find some use for it.
4) **Headings** - Just ignore this cell type. In fact, if you try to use it, Jupyter will instruct you to just learn Markdown. I told you it was useful!  

Ok, let's get started. Type the following into your first cell:
```
# This is what happens when you use begin a line with "#" inside this cell type
```
Now find the "Run" icon and execute that command. Not a whole lot should happen, but you've probably also created a new empty cell below. There are two reasons for this:  
1. By default, your cell type is *code*, which is speaking in Python.
2. In Python language, any time you start a line with the "#" character, it acts as a `comment`, which means no code will be executed. More on this in a second.  

Here's a screen capture of what it should look like for you:
<img src="https://raw.githubusercontent.com/devonorourke/digitalHeap/master/hssci/images/hssci-l1-scap1.gif" />  

Great, now copy and paste the previous text into the second code block. But this time, **don't click run!**. Instead, do the following two things:
1) Find the icon that currently has "Code" listed, and change that to "Markdown". 
2) Click "run"  

What changed? The cell should have generated some text. It looks like the cell block sort of disappears, but you can double click on that text you just created and edit it. Try editing that text then click "run" again and see if you can make your own changes. I've also pasted the same text into another cell, then deleted the `#` symbol. Notice how the same **markdown** cell type produces a different output depending on whether or not a `#` is present? That's part of the syntax of that language - a `#` means "display this text like a header". Again, check out [this cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) to look into the subtletys of the the markdown language.

Hopefully it looked something like this:  
<img src="https://raw.githubusercontent.com/devonorourke/digitalHeap/master/hssci/images/hssci-l1-scap2.gif" />  


Great, now let's try that last kind of cell type - Raw NBConvert. Paste that same initial text into the next empty cell, click that same "code" icon and change it to "Raw NBConvert", then click "run". And what do you see? Nothing changes! The thing about this cell type is that it just prints whatever you enter - no fancy changes.  

Something along these lines:
<img src="https://raw.githubusercontent.com/devonorourke/digitalHeap/master/hssci/images/hssci-l1-scap3.gif" />  

## Super brief intro to Python using the *code* type of cell
Let's dive into using the *code* type of cells to do the three main things we'll be doing over and over agin: 
- performing calculations
- working with functions to produce graphics
- importing programs to perform myriad output outside of the Anaconda base programs (of which there were > 700!)

### Basic calculations
If your head isn't spinning yet, awesome. If it is, don't worry (it probably should be). In just two short lessons you've had to learn how to speak in three computer languages (`bash`, `markdown`, and now `Python`), navigate how to click through a bunch of new programs (`Jupyter`, `Terminal`), and somehow we haven't even got to the chemistry - but we will (sort of) right now!  

I say "sort of" because what we're about to do has nothing to do with *chemistry* at all. It has everything to do with *language* - specifically, the language of Python. What we need to do first is learn how to speak in Python. Like any new language we're going to start with basic parts of speach and build from there. For today's lesson we'll introduce a few new terms (**in bold**) which aren't really Python specific as much as computer-programming generic:  

**Statments** are like sentences; they can be complicated or simple; they can be long or short.  
Here are two examples of statements:  
First, a statement where we **assign** a **variable** `x':
```
x = 5
```
In other words, any time you type `x`, the computer will remember that it equals `5`. Just like your first Algebra class, we can then use this variable to do whatever we want.  

For instance, in this next statement, we use that **assigned variable** (and a new variable) to create an output, *and* we then tell the program to provide us with a result by :  
```
x = 5
y = 2
print(x + y)
``` 

Try typing this into your first *cell* in the notebook. Run the cell with *code* default behavior. See an output you expect? Nice! Now try editing the original text with the default `code` cell type; maybe change the value of `x` or the expression in the `print` statement from `+` to `-`. Does it continue to function as you expect? It should look something like what I've done below. Take note of two things:
- First, I've showed you how to execute addition, subtraction, division, multiplication, and exponents)  
- Second, that last line is called a **print statement**, and when you click "run" you'll generate an output. Without that `print` function, you won't get any useful calculation out of executing the code.  

<img src="https://raw.githubusercontent.com/devonorourke/digitalHeap/master/hssci/images/hssci-l1-scap4.gif" />  

You should also try changing the *cell* type from `code` to `Markdown` - what happens? What about changing it to `NB Convert`? And weirdly - why is there that error? More on that in a sec... At this point you're probably going to have lots of questions about just how to speak Python, and there are a lot of answers. Most times you'll end up Googling something and see a massive computer-science-looking cheatsheet with lots of information [like this one](https://perso.limsi.fr/pointal/_media/python:cours:mementopython3-english.pdf) that makes the "basics" seem not so basic. Don't worry - we won't have to conver all of that, but just know that the information is out there. If this kind of thing seems really fun to you, I'd suggest staring with [Python's tutorials](https://docs.python.org/3.6/tutorial/index.html) - they cover a lot - but you can rest assured we'll give you everything you need to get through the material for this program.  

But think back to that last error - why did that happen? What did that even mean? The last line of the output really says it all:
```
NameError: name 'sqrt' is not defined
```
I tried executing a **variable** called `sqrt` to my print statement. But Python has no idea what `sqrt` means. We can do two things about that:  
1. We can write our own function named `sqrt`, and then use that function to complete the square rooting of whatever values we want.  
2. We can import someone else's function who already did this.  

I'm lazy, so we're going with option 2. As an added benefit, it illustrates another thing we'll routinely do: importing another program.  

## Importing modules you already have
Python is a language that has its own core set of programs - termed **modules** - which perform a diverse set of tasks. Some are highly specified and short, others are highly specified and enormous, and others still are broadly applicable to a lot of tasks. What we're going to need to do first is import a program that does square rooting. How do we do that? Easy, that's how.  

We'll need to do this in an empty `code` block:  
```
from math import *
```

Then execute the original script we last tried in a new code block below:  
```
x = 9
y = 3
print(sqrt(x))
```

Boom! You can square root to your heart's content. So what did we just learn? Well a few things:
1. There's this thing called `import` which is a function which lets you access other programs which aren't currently running when we first start our Jupyter Notebook.  
2. There's this thing called `math` which is a program that lets me do square root calculations.  
3. There's this weird astersik `*` which I don't understand yet. *Don't worry. It's called a wild card. We'll talk about [regular expressions](https://docs.python.org/3/library/re.html) later.*  

Okay, so is Jupyter Notebook just a glorified calculator? What about importing something that doesn't do math. Does Jupyter Notebook let me do something that my TI-89 can't (or iPhone, or whatever)? Yup. [More than you care to imagine](https://github.com/jupyter/jupyter/wiki/A-gallery-of-interesting-Jupyter-Notebooks). And that leaves us with our second to last task for today - remember way, way back at the beginning of this lesson we talked about downloading some program called `nglview`? Let's do that next.

## Importing modules you don't yet have
Thanks to Anaconda, this is a fairly simple task to complete - but you have to go back to your `Terminal`.  From the command line, type:
```
cd ~
conda install nglview -c bioconda
conda install -c ambermd pytraj
jupyter-nbextension enable nglview --py --sys-prefix

## If you happen to get a message "Proceed ([y]/n)?" just type "y" then hit 'enter'
```
In just those few short lines of code you have:
a) downloaded the most recent version of the tool(s)  
b) downloaded all dependent programs this tool requires that you might not have  
c) perform version-compatibility among those various programs to make sure nothing breaks  
d) put it in a place on your computer where it will work seamlessly so you can call it up from any position on the command line.  

Nice and easy thanks to Conda. Now we have this program installed but we haven't yet loaded the program; that is, it's available to us, but we haven't told our Jupyter Notebook (via Python) to go and make it available. Just like how we had the `math` module available to us but needed to first type `import` to get it working. Let's do that with `nglview` and see what's under the hood - in a new cell type and run:  

```
import nglview
view = nglview.show_pdbid("3pqr")
view
```

What are you seeing here? As [explained on their example page](https://github.com/arose/nglview#example) what you're seeing is a visualization of a complex arrangement of molecules - in fact, this is a [rhodhopsin protein](http://www.rcsb.org/pdb/explore.do?structureId=3pqr) which is involved in making eyesight possible. Pretty crazy right? What did that code do? Essentially it does just two things:  
- `import nglview` finds the program you want to run and makes it available for use
- `view = nglview.show_pbid("3pqr")` loads the protein named **3pqr** by downloading it from the Royal Soceity's Protein Database. If you check out RCSB's site you could [search for any protein](http://www.rcsb.org/pdb/home/home.do#Category-search) you're interested in and immediately view it in your notebook - pretty powerful stuff. For example, try substituting the `3pqr` term with `1bpx`; any idea what that depicts? 

So it turns out that your Notebook isn't just a calculator. It also can connect with the internet, download other programs, other data sets, and much, much more. To give you one other flavor of the kind of thing you might find useful in your notebook, lets call up a program installed with your Anaconda distribution and make a quick graph.  

## Graphing in Jupyter
There is so much more that we need to discuss, but to just give you a sense of how quickly you can generate a nice little figure try executing the following few lines of code in your Notebook:
```
import matplotlib.pyplot as plt
import numpy as np
```
Run that code. Notice that nothing happens. Why? Because all you've done is `import` the needed programs which were already part of the Anaconda install (these are `matplotlib` and `numpy` in case you're wondering). Once those programs are ready to be used, let's actually generate a figure with this little code (*which you can and should manipulate to see how things change*):
```
x = np.linspace(0, 3*np.pi, 500)
plt.plot(x, np.sin(x**2))
plt.title('Do I know anything about sine functions? Sure I do');
```

# End Notes
We're done for today - awesome work! To close out of your Jupyter Notebook you'll need to do two things:
- Save the notebook by clicking the 'save' icon in the top left of your active notebook
- Go to the *Notebook dashboard* tab and click the empty box next to your active notebook, then select "shut down".  

Congrats - you covered a lot of ground in just a few hours. 
- We've worked through using the `Terminal` program to download big and small packages, create folders, and move about the computer without ever clicking a mouse once. We'll continue to expand our `bash` language used in the `Terminal` program as we continue in future lessons.  
- You've launced your first Jupyter Notebook and learned some of it's basic functionality in using the different cell types. - You executed a variety of different code using the Python programming language (specifically the Python3 language). 

We're going to dig into many other tools in subsequent lessons, but you have covered probably the most novel portions of the work already. In other words, the hardest stuff is usually the most foreign, and from hereon out things should get more and more familiar. Moreover, future lessons will also be more specific and target specific programs to do specific things. So stay excited - we're just getting started!








