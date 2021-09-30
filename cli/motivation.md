## Why to learn Shell?

### Command-line interface vs Graphical user interface

Humans and computers commonly interact in many different ways, such as through a keyboard and mouse, touch screen interfaces, or using speech recognition systems. The most widely used way to interact with personal computers is called a **graphical user interface** (GUI). With a GUI, we give instructions by clicking a mouse and using menu-driven interactions.

While the visual aid of a GUI makes it intuitive to learn, this way of delivering instructions to a computer scales very poorly. Imagine the following task: for a literature search, you have to copy the third line of one thousand text files in one thousand different directories and paste it into a single file. Using a GUI, you would not only be clicking at your desk for several hours, but you could potentially also commit an error in the process of completing this repetitive task. This is where we take advantage of the Unix shell. The Unix shell is both a **command-line interface** (CLI) and a scripting language, allowing such repetitive tasks to be done automatically and fast. With the proper commands, the shell can repeat tasks with or without some modification as many times as we want. Using the shell, the task in the literature example can be accomplished in seconds.

### The Shell

The shell is a program where users can type commands. With the shell, it’s possible to invoke complicated programs like climate modeling software or simple commands that create an empty directory with only one line of code. The most popular Unix shell is Bash (the Bourne Again SHell — so-called because it’s derived from a shell written by Stephen Bourne). Bash is the default shell on most modern implementations of Unix and in most packages that provide Unix-like tools for Windows.

Using the shell will take some effort and some time to learn. While a GUI presents you with choices to select, CLI choices are not automatically presented to you, so you must learn a few commands like new vocabulary in a language you’re studying. However, unlike a spoken language, a small number of “words” (i.e. commands) gets you a long way, and we’ll cover those essential few today.

In addition, the command line is often the easiest way to interact with remote machines and supercomputers. Familiarity with the shell is near essential to run a variety of specialized tools and resources including high-performance computing systems. As clusters and cloud computing systems become more popular for scientific data crunching, being able to interact with the shell is becoming a necessary skill. We can build on the command-line skills covered here to tackle a wide range of scientific questions and computational challenges.

### Motivation: A Typical Problem

Imagine, you got a data from sequencing experiment and you want to look for some over-represented motifs and write up results into a paper. You have several programs you need to run in sequence to analyse a data. Let's say, that you have 10 program where each program takes as an input data output from previous program. Bad news is, that instead of writing your paper, you will be waiting for one program to end so you can run another one with new data. However, with the use of the shell, you can assign your computer this mundane task while you focus your attention on writing your paper. As a bonus, once you put a processing pipeline together, you will be able to use it again whenever you get more data.

In order to achieve this task, you needs to know how to:

 - navigate to a file/directory
 - create a file/directory
 - check the length of a file
 - chain commands together
 - retrieve a set of files
 - iterate over files
 - run a shell script containing a pipeline

---

[Home](https://katarinagresova.github.io/DSIB01_2021/cli/index.html)
[Next page](https://katarinagresova.github.io/DSIB01_2021/cli/intro.html)
[Previous page](https://katarinagresova.github.io/DSIB01_2021/cli/index.html)
