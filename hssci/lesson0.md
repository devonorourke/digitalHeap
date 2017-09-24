# on the soapbox
We have a few goals with this notebook:  
1) **Work smarter, not harder**. Why spend most of your time in class performing calculations when computers can do them for you? Let's use computers what they're made to do: compute!
2) **Learn something useful**. It's natural to ask the question *why do I need to learn this material*. It's also pretty natural to hear some convoluted response about how if you want to be an X or Y in life, you're going to need to know A, B, and C. Sure... Yes, you're going to learn chemistry. But realize that this project will simultaneously provide you with a small set of computational tools that you can apply in the short term and long term, whether you're interested in engineering, economics, or fantasy football (okay, [or sabermetrics broadly](https://shenjeffreydatascience.tumblr.com/post/101741302014/data-science-sabermetrics)). In other words - this computer stuff? It applies to everything that has anything to do with using data. And just about any career you think about can use some sort of data analytic tools you'll start to use here.  
3) **Learn by doing**. Plain and simple - let's actually do the stuff you're learning about. Code. Break code. Recode. Learn.

# almost ready to start
First things first - how are we going to do any of this? I wanted to take a second to explain how we're going to communicate all of this. Generally the way we're going to explain something for you to do is by separating the text you see here with a `block of instructional code` which is unique from this information. Below are two examples that show one of two situations you will often come across: doing some sort of calculation (example 1) or downloading some sort of software (example 2).  

**Example 1 - example code to perform some calculation**
```
## example 1: some sort of calculator
x = 12
y = 4
print (x+y)
```
**Example 2 - example code to download some software**
```
## example 2: some sort of software
cd $HOME
conda install -c schrodinger pymol
```
What's nice about the code blocks above is that you'll often just copy and paste from this screen and on to another screen. Nice - you don't even have to type much in this project! Another thing worth mentioning - see those `##` characters above? - they're used in code blocks as *comments*; that is, they don't actually get interpreted by the computer to execute anything - they're just used by the programmer (me/you) to communicate with the user (you/me) about what is going on within the code. Pay attention for them as they often provide useful insights into what's going on with the code.  

Once software is downloaded (that's next!), you'll follow along with the instructions on other webpages to complete individual lessons. Fortunately though, the format is the same: some explanatory text and some code blocks. Think of this page as the introductory guide to getting you going with the installation work. Other webpages are dedicated to the individual lessons. Let's get started!  

# The Big install: Anaconda
One side note to star things off:  
> this program is big, so ensure you have enough hard drive space before install. Ask if you aren't sure. I probably should have written this course for an Amazon Cloud instance and you can remind me of my mistake in class when a dozen students have 2008 Dell machines running Windows Vista.*  

**Download Anaconda**.  
- Go [to this site](https://www.anaconda.com/download/) and download the **Python 3** software appropriate for your OS (Operating System). I'll say this again - **download Python3, not *Python2* unless you want to make your/my life difficult**. And one final time: **download Python 3.6** DO NOT download Python 2.7. Hope that's clear.  
What's going to happen next? You'll download a file and open it, then click and follow along with the default installation parameters. This should be as quick and painless as installing iTunes.  

- What did you just install? Probably a good thing to ask. Fortunately it's explained right on a tab from the page you just downloaded from - [see here](https://www.anaconda.com/what-is-anaconda/). If that doesn't help, think of Anaconda like this: 
> 1) It's a piece of software that *included* both Python (we'll get to what Python is in a second) and many other useful programs. That is, you just downloaded a bundle of things, not just one thing.
> 2) Anaconda also isn't just a bundle. It has its own purpose too, and contains software that allows you to find and download other software you don't have yet but want to get seamlessly (this is often called a *package manager*). In other words, Anaconda comes with some preinstalled stuff, but also has the capacity to let you keep getting new stuff in one place. It may not be apparent at first, but trust me when I say that this is a very helpful feature.
> 3) Finally, Anacaonda is piece of software that is free, constantly updated, and used by millions of people. A lot of folks create software and make it available to you. Translation: you just opened a door to a world of folks doing work for you!  

Question... why are you spending $$$ on textbooks when folks are providing all this frees stuff? Turns out most of these tools are driven by an underlying assumption: you have a goal in mind. This is where the computer stuff meets the chemistry stuff (or biology, or engineering, or linguistic, or economic). You have to *provide* these tools with some sort of context; in our case, that context is chemistry. But bear in mind that these tools are flexible enough that they'll work with just about anything you can throw at them, be it molecules, genes, words, numbers, etc. Okay, so I still didn't address why you should ever pay for a textbook, but hopefully at this point you realize you need some sort of foundational knowledge to actually use these cool *free* new computational tools.  

- So if Anaconda contained a bunch of programs, one of which was Python itself (specifically Python3 in this case), just what is Python? You can [read the official blurb here](https://www.python.org/doc/essays/blurb/). An unofficial blurb? It's a computer language, and like many computer languages it's a mechanism to facilitate communication between you and your computer. What are we going to do with Python? We're going to learn that it's language to talk to the computer - that's it! As with human language, computer languages are diverse in their history, syntax, and ease with which a novice can learn them. Python turns out to be a (relatively) clear language to work with, is widely adopted across a diverse set of academic disciplines, and contains many packages we'll work with. So it seemed like the sensible choice, but notably, it's far from the only one.  

**That's it!** Next lesson will be to download our first program, and begin to think about how we're going to organize all the information we want to discuss in the subsequent lessons.
