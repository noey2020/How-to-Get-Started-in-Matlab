# How-to-Get-Started-in-Matlab

September 14, 2020

I appreciate comments. Shoot me an email at noel_s_cruz@yahoo.com!

Hire me! 😊

MATLAB is an environment for all kinds of technical computing - like data analysis, 
simulation, and algorithm development. This article will show you the basics and
give you an idea of what working in MATLAB looks like. I will tell you where to go
next to learn MATLAB in depth. So, let's get started. 

This is one of the buildings at MathWorks headquarters in Natick, Massachussetts.
See all those nice solar panels? Well, let's see if they're working properly. There's
a theoretical model that says what the production should be. Let's implement that and
compare it with the actual data recorded from the panels.

First, we need some constants: the latitude of Natick and the "solar declination,"
which is just an angle that tells us how high in the sky the sun gets on a given day.
These are values we can look up. Let's use the value for June 21, the longest day of 
the year, so that will give us the maximum amount of production. Our calculations are
entered in the Command Window and executed immediately and we can see the variables 
we've just created over here in the Workspace.

The angles we've just entered are in degrees, but if we're going to do math with them,
it might be better to convert them to radians. We can do standard mathematical
calculations and assign the result to a new variable or even overwrite the same 
variable. Here we're using the built-in value of pi to do the conversion manually.
But we could also use one of the many built-in MATLAB functions.

Next, we want to calculate the production throughout the day, so we need a range of
times. Let's make a vector to represent time of day. We'll start at 5:30, a little
after sunrise, and go in 15-minute increments until 8:00, just before sunset. 

Our formula uses local solar time. That's not exactly the same as the time on the 
clock, because of conventions like time zones and daylight savings. So, we'll take 
our vector of times and apply a shift. 

And now we're ready to calculate the effect of the angle between the sun and the
panels. This equation is long, but the MATLAB code looks just like the math, so it's
easy enough to implement. Again, this part of the formula is assuming degrees instead
of radians, so we could convert or... we could look in the documentation to get more 
information about trigonometric functions, where we discover that there’s a cosd 
function that accepts inputs in degrees rather than radians. MATLAB has functions for
all sorts of things, from trigonometry to outlier detection to curve fitting to graph
theory to signal filtering. So it’s always good to check the documentation.

Now that we know about cosd, we can complete our formula. And let's add a semicolon
to the end of the line so the result isn't displayed. If we want to look at the values,
we can always double-click on the sunangle variable in the workspace: it opens up the
Variable Editor. But it's probably more informative to view it graphically. We can
select the variables t and sunangle, and go to the Plots tab in the toolstrip. Select
a plot and there it is. And now we also have the code so we know how to do that
programmatically next time. The intensity of radiation due to the angle of the sun
should be 0 as the sun rises and sets and peak at local noon. And we should get 100% 
intensity when the sun is directly over the panels. But in Massachusetts the sun never
gets directly overhead, even in June, so the plot looks about right. 

Okay, that’s the angle of the sun accounted for. To complete the model, we need to 
calculate the effect of the atmosphere. The more air the light has to get through,
the less energy makes it to the panels. Let's enter this empirical equation and
.... oops, something went wrong. Fortunately, this helpful error message lets us know
that we made a common mistake. MATLAB works naturally with vectors and matrices, 
including doing matrix math. So, by default, MATLAB thinks this carat is a matrix 
exponential. But that's not what we meant - we want the exponent for each element of
the array, so let's use the up arrow to recall that command, then do what the error
message says and change the exponent operation to dot-carat.

Finally, we just need to multiply the two intensity factors together (and we've
learned from the previous error, so we'll use dot-star this time), and multiply by the
size of the panels to get the total theoretical energy production. Check the plot - 
looks reasonable, so there it is: the theoretical maximum production we should get
from our solar panels. This is what we should see on June 21st, if it’s a perfect sunny
day. Next, we need to get the actual data and compare the two.

But before doing that, it might be a good idea to save what we've done in a script.
Let's go back through the command history and select the commands we used to get here,
right-click, and select Create Live Script. This opens the editor with a script
containing the selected commands. We can now edit commands, and because we have a live
script, we can make this more useable by splitting into sections, adding text, comments,
headers, images, equations, and so on. Now we can run sections of code, or the whole
script, and the output appears in the output panel next to the code. We can use the 
interactive tools to clean up our plot. And, again, we get the code so we can add it
to our script.

Now for the data. In the Current Folder Browser we can see we have a spreadsheet that
contains the recorded production for June 2018. Let's import that data. The Import Tool
looks at the contents of the file. It recognizes the first column as timestamps, so
wants to import those in a data type that's suitable for dates and times. It also wants
to import all the data together as a table, which is a data type designed for this kind
of spreadsheet data where we have a bunch of observations of several different
variables. So, let’s just import the data in this form, but maybe with a slightly 
simpler variable name. Now we have this variable, production, which is a table with 2,880
observations of three variables. The three variables are time and the electricity 
produced by two different solar panel arrays.

Having imported some data, a good first step is often to plot it to get an idea of what
you’re dealing with. So, let’s use the plot function. To get the individual variables 
within the table, we use dot notation – the name of the table, dot, and the variable name.
And note the useful programming aids that suggest completions. Run this section of the
script to see the results. Because the timestamps were imported as a datetime variable, 
the x axis of our plot is labeled as dates, so we can see the 30 daily spikes for the 
month of June. We can use the interactive tools to explore the plot a bit. We can see
there were some cloudy days, including the 21st, unfortunately. But over here you can see
the 26th was perfect. 

So how do we get the production for one chosen day? Well, there are several different
ways we could do this, but if we’re interested in slicing the data by day or time of day,
it might be useful to rearrange our data from one continuous time series to a grid of
times and days. This approach makes sense for this data which is recorded uniformly every
15 minutes, so the 2880 measurements for June correspond to 96 measurements - 4 per hour -
for each of the 30 days in the month. So, let’s use the reshape function to change the 
long vector into a 96-by-30 matrix. 

Now it’s easy to extract the data for any given day. To get the data for the 21st, we go
into our matrix and take all rows of the 21st column. This data is recorded throughout the
day, so we need to make a vector of times from midnight to midnight and now we can plot it.
Let’s add a style specification to show the actual data points. 

And now we can give both the theory and the data to the plot function so we can see them 
together. As expected, the data for the 21st isn’t very good. But remember that the 26th 
did look good and a few days won’t change the angle of the sun that much, so let’s look at
that day. Thankfully, it’s easy to change to a different day and rerun the section. 

Now we can see that the data agrees with the model, well, up to a threshold of how much 
the inverters can handle. For our system, the panels can produce up to 270 kW, but the
inverters have a limit of 207 kW. We can go back and use the min function to add this 
limiting behavior to our model. Rerun the script... And now we see that the data agrees
very well with the theoretical model. 

We’ve done some great work here. So, we should share it. If we just want to share our
findings with someone, we could save a copy of the script as a static document, like a PDF.
But we can also give this script (along with the data file) to anyone with MATLAB and they
can run it for themselves and reproduce our results. They can edit the script, explore the
data, refine the model, and perform new analysis.

And, now that you have a feel for what working in MATLAB is like, it’s time to learn it 
properly. There’s no better way to learn MATLAB than to work with it. So, head over to 
MATLAB Onramp, which will teach you the basics of MATLAB interactively - you’ll actually
enter MATLAB commands in our online training environment and get instant feedback. It’s
free and should take just a couple of hours. You can leave any time and come back later.
Welcome to MATLAB!

I included some posts for reference.

https://github.com/noey2020/How-to-Convert-Data-from-Web-Service-Using-Matlab

https://github.com/noey2020/Quote-for-the-Day

https://github.com/noey2020/How-to-Talk-Good-Investment-Strategy

https://github.com/noey2020/How-to-Talk-of-Good-Plan

https://github.com/noey2020/Thought-for-the-Day

https://github.com/noey2020/How-to-Talk-Stock-Watch-of-the-Day

https://github.com/noey2020/How-to-Talk-Data-Science

https://github.com/noey2020/How-to-Talk-Fundamental-Analysis

https://github.com/noey2020/How-to-Read-Company-Profiles

https://github.com/noey2020/How-to-Import-Data-from-Spreadsheets-and-Text-Files-Matlab-Without-Coding

https://github.com/noey2020/How-to-Talk-Model-of-Stock-Market-Prices-

https://github.com/noey2020/How-to-Talk-Digital-Wallets

https://github.com/noey2020/How-to-Talk-Investing

https://github.com/noey2020/How-to-Double-Your-Money-in-5years

https://github.com/noey2020/How-to-Talk-Matlab

I appreciate comments. Shoot me an email at noel_s_cruz@yahoo.com!

Thanks for reading, and happy coding.

Hire me!

Noel
