# Motivation
At a brunch conversation with a high school stats teacher we were talking about what to do with non-senior students and class work once the seniors have finished their work but there are still school days left on the calender. Why not do a fun project in R? Because the teacher was a football fan and the NFL draft had just been completed I wondered if we could use a site with lots of football data - [Pro Football Reference](https://www.pro-football-reference.com) - to explore a bunch of things:  
1. Get kids to do some stats using real data
2. Use R and RStudio to do the number crunching and data viz
3. Test out my first go at web scraping

That third one is what this blog is all about - I went to the site and was disappointed that I could download multiple years of data - it kept needing me to load a new page to get more of the data. Then I realized someone had [already written a blog](http://savvastjortjoglou.com/nfl-draft.html) about how to do the exact thing I wanted to do, but used Python tools to do it. So let's see if we can do this in R.

# Webscraping
I was following [this guide to R webscraping] to start.  
