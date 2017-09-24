# Another install?!?
So recall that in the [introductory lesson](https://github.com/devonorourke/digitalHeap/blob/master/hssci/lesson0.md) we downloaded [Anaconda](https://www.anaconda.com/what-is-anaconda/), which contained [Python](https://www.python.org/about/gettingstarted/) as well as many other unnamed software packages. Basically, we downloaded some soft of Russian nested dolls of software. As mentioned earlier, one other advantage of doing this big installation was that we could quickly manage future downloads of additional software we might want/need. So to get our first lesson rolling we have to do just that - we need to download a program called [Jupyter Notebook](http://jupyter.readthedocs.io/en/latest/index.html)!  

You might be considering asking the following questions:  
> 1) How many times are we going to be downloading software? Is that all this course is about?
Answer: You will download software routinely. This is not what the course is about.  
> 2) Why am I downloading *this particular software*?
Answer: Better question! We're using this software because it's a digital notebook which lets you simultaneously write the code you want to perform a function, execute that code within the program, see the output of that code, **AND** let's you separate out all your code, output, and basic note taking into convenient blocks. It does a lot of useful stuff, okay?   
> 3) I don't have any other questions... how do I do this so I can get to lunch?
Answer: See below. And you can eat in lab for all I care.  

# Welcome to your console
Here's the thing - you're going to have to get at least a little bit familiar with a terminal emulator - a.k.a. console. This is the piece of software that will make your parents nod whimsically (or run fearfully). It's the super low-tech-looking (but not actually low tech!) piece of software on every computer that acts as the platform with which you can talk to your computer without clicking anything - just by typing. If you've never used it, it seems really strange. If you have used it before, it seems strangely amazing. However, depending on your OS (Operating System) of choice, you communicate with your console using different languages - in other words, 'speaking' with a Windows machine is executed differently than with a Mac. Here's the basics to consider:  

- Do you have a **Windows machine**? Things are going to be more difficult. In brief: we're going to need to work on this separately before you can move on. I'm going to write all conventions for a Unix OS platform, so it would be best to either [install a Linux distribution directly](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide) if you have Windows 10, or perhaps just install a terminal emulator ([one example here](http://mobaxterm.mobatek.net/)) that contains some Unix-like commands needed to do what we're going to do.  
- Do you have a **Linux machine**? Congrats, you're the weird kid. See instructions for Mac below. But you already knew that.  
- Do you have a Mac machine? Sweet. Do two things:  
  - Click on that *Spotlight* search icon in the top right of your computer and look for a program called `Terminal`. Open that up. Now we can talk to the computer!  

## Terminal basics 
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

### Navigating the command line
You know how when you open a window to look for some file you search through folders within folders within folders? Like how you can have a folder called "My Documents", and within that maybe multiple folders for each class? And how within that class you have perhaps other folders for each unit? And within whatever that unit folder is called you have things like a Word document, pictures, maybe a spreadsheet file, or a movie? Computers simplify this whole thing by boiling down everything into two things: **directories** or **files**. Directories are places where you store things. Files are everything that isn't a directory, which is to say things hold data or programs that can execute functions.  
Why mention all this? Because when you're working within the `Terminal` program, you are essentially "in" one of those folders, and everything you do assumes that, by default, you are trying to do it in that very specific location. You can think of this "folders-in-folders-in-folders" structured as a tree - [see here for an example](http://dsl.org/cookbook/cookbook_8.html). With that tree structure in mind, let's get started moving around... 

First, let's figure out where we are right when we open up the `Terminal` program. Just type:
```
pwd
```
In case it wasn't obvious, you also need to press "return" or "enter" on your keyboard. Notice how the program then exeuctes the command and generates an output? Hopefully it looked something like this:  
```
/Users/do
```
You'll probably have something slightly different, but a few key features to point out:  
1. Like any tree, we start at the root. Our directory structure - that is, the organization of how all the folders and files are related - starts with a single symbol `/`. This is the *root* directory. One folder *within* that directory - termed a *subdirectory* - is called `Users`. The next subdirectory (the folder within the `Users` folder) is termed `do`. So what we really have are three levels of folders, going from the parent directory to subsequent subdirectories:  
**root** --> **Users** --> **do**. Organizationally, the output of the `pwd` command showed something termed the **full path**, which is to say, an ordered list of directories (folders) from the most parent (root) directory to whatever your current directory is. In other words, `pwd` really just **P**rints the full path to the **W**orking  **D**irectory.

So `pwd` tells us where we are, but how do we get somewhere else? What we really need to do is 
