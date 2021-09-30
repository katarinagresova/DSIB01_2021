This lesson is building on top of previous lesson and you should already have:
 - linux environment,
 - github account,
 - forked demo repository from [https://github.com/eliska-chalupova/DSIB01demo](https://github.com/eliska-chalupova/DSIB01demo),
 - local clone of forked repository.

This lesson guides you through the basics of file systems and the command line interface (cli). If you have stored files on a computer at all and recognize the word “file” and either “directory” or “folder” (two common words for the same thing), you’re ready for this lesson.

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

## Gentle introduction

When the shell is first opened, you are presented with a **prompt**, indicating that the shell is waiting for input.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$</p>
  </div>
</div>

The shell typically uses `$ ` as the prompt, but may use a different symbol. In the examples for this lesson, we’ll show the prompt as `$ ` . Most importantly: when typing commands, either from these lessons or from other sources, do not type the prompt, only the commands that follow it. Also note that after you type a command, you have to press the `Enter` key to execute it.

The prompt is followed by a **text cursor**, a character that indicates the position where your typing will appear. The cursor is usually a flashing or solid block, but it can also be an underscore or a pipe. You may have seen it in a text editor program, for example.

### First command

So let’s try our first command, `ls` which is short for listing.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ls</p>
  </div>
</div>

When we hit enter, we will get list the contents of the current directory:

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ls</p>
    <p>anaconda3     Documents   DSIB01demo    Pictures     snap      Videos</p>
    <p>Desktop   Downloads     Music     Public     Templates</p>
  </div>
</div>

### Command not found

If the shell can’t find a program whose name is the command you typed, it will print an error message such as:

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ks</p>
    <p>ks: command not found</p>
  </div>
</div>

This might happen if the command was mis-typed or if the program corresponding to that command is not installed.

### Clearing your terminal

If your screen gets too cluttered, you can clear your terminal using the `clear` command. You can still access previous commands using `↑` and `↓` to move line-by-line. 

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ls</p>
    <p>anaconda3     Documents   DSIB01demo    Pictures     snap      Videos</p>
    <p>Desktop   Downloads     Music     Public     Templates</p>
    <p>$ ks</p>
    <p>ks: command not found</p>
    <p>$ clear</p>
  </div>
</div>

Up to now, we already have our terminal full of information. We use `clear` command to get back to empty terminal.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ls</p>
  </div>
</div>

## Navigating Files and Directories

The part of the operating system responsible for managing files and directories is called the **file system**. It organizes our data into files, which hold information, and directories (also called ‘folders’), which hold files or other directories.

First, let’s find out where we are by running a command called `pwd` (which stands for ‘print working directory’). Directories are like places — at any time while we are using the shell, we are in exactly one place called our **current working directory**. Commands mostly read and write files in the current working directory, i.e. ‘here’, so knowing where you are before running a command is important. `pwd` shows you where you are:

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ pwd</p>
    <p>/home/student</p>
  </div>
</div>

Here, the computer’s response is `/home/student`, which is our **home directory**.

### File system

To understand what a **home directory** is, let’s have a look at how the file system as a whole is organized. For the sake of this example, we’ll be illustrating the filesystem in a simplified view.

![](https://github.com/katarinagresova/DSIB01_2021/raw/gh-pages/assets/img/file_system.svg)

At the top is the **root directory** that holds everything else. We refer to it using a slash character, `/`, on its own; this character is the leading slash in `/home/student`.

Inside that directory are several other directories: `bin` (which is where some built-in programs are stored), `data` (for miscellaneous data files), `home` (where users’ personal directories are located), `tmp` (for temporary files that don’t need to be stored long-term), and so on.

We know that our current working directory `/home/student` is stored inside `/home` because `/home` is the first part of its name. Similarly, we know that `/home` is stored inside the root directory `/` because its name begins with `/`.

Typically, when you open a new command prompt, you will be in your home directory to start.

### Absolute and Relative Paths

Whenever we refer to either a file or directory on the command line, we are in fact referring to a path. ie. a path is a means to get to a particular file or directory on the system.

There are 2 types of paths we can use, **absolute** and **relative**. Whenever we refer to a file or directory, we can, in fact, use either type of path (either way, the system will still be directed to the same location).
 - Absolute paths specify a location (file or directory) in relation to the root directory. You can identify them easily as they always begin with a forward slash ( / )
 - Relative paths specify a location (file or directory) in relation to where we currently are in the system. They will not begin with a slash.

To demonstrate, we can use command `ls` to look, what we have in `DSIB01demo` folder. We know, that `Desktop` is in our home directory, so we use path `/home/student/DSIB01demo` as parameter for `ls` command.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ls /home/student/DSIB01demo</p>
    <p>demo files LICENSE playground README.md scripts</p>
  </div>
</div>

Since we are already located in our home directory (as we verified by running `pwd` command), we can also reference path relatively from our current location and write just `DSIB01demo`.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ls DSIB01demo</p>
    <p>demo files LICENSE playground README.md scripts</p>
  </div>
</div>

### More on Paths

You'll find that a lot of stuff in Linux can be achieved in several different ways. Paths are no different. Here are some more building blocks you may use to help build your paths.

 - `~` (tilde) - This is a shortcut for your home directory. eg, if your home directory is `/home/student` then you could refer to the directory `Desktop` with the path `/home/student/Desktop` or `~/Desktop`
 - `.` (dot) - This is a reference to your current directory. eg in the example above we referred to `Desktop` with a relative path. It could also be written as `./Desktop` (Normally this extra bit is not required but in later sections we will see where it comes in handy).
 - `..` (dotdot)- This is a reference to the parent directory. You can use this several times in a path to keep going up the hierarchy. eg if you were in the path `/home/student` you could run the command ls `../../` and this would do a listing of the root directory.

So now you are probably starting to see that we can refer to a location in a variety of different ways. Some of you may be asking the question, which one should I use? The answer is that you can use any method you like to refer to a location. Whenever you refer to a file or directory on the command line you are actually referring to a path and your path can be constructed using any of these elements. The best approach is whichever is the most convenient for you.

### Moving around

In order to move around in the system we use a command called `cd` which stands for **change directory**. The command `cd` may be run without a location and then it will always take you back to your home directory. But usually it will be run with a single command line argument which is the location we would like to change into. The location is specified as a path and as such may be specified as either an absolute or relative path and using any of the path building blocks mentioned above.

Result of `cd` command is that our current working directory will change.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ pwd</p>
    <p>/home/student</p>
    <p>$ cd ../</p>
    <p>$ pwd</p>
    <p>/home</p>
  </div>
</div>

Now let's try going back to home directory.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ cd</p>
    <p>$ pwd</p>
    <p>/home/student</p>
  </div>
</div>

`cd` without an argument will return you to your home directory, which is great if you’ve gotten lost in your own filesystem.

Move around a bit.


<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ pwd</p>
    <p>/home/student</p>
    <p>$ cd DSIB01demo</p>
    <p>$ ls</p>
    <p>demo files LICENSE playground README.md scripts</p>
    <p>$ cd /</p>
    <p>$ pwd</p>
    <p>/</p>
    <p>$ ls</p>
    <p>bin dev lib libx32 mnt root snap ...</p>
    <p>$ cd ~/Documents</p>
    <p>$ pwd</p>
    <p>/home/student/Documents</p>
    <p>$ cd ../../</p>
    <p>$ pwd</p>
    <p>/home</p>
    <p>$ cd</p>
    <p>$ pwd</p>
    <p>/home/student</p>
  </div>
</div>

## Getting help

The Linux command line offers a wealth of power and opportunity. However, it might be hard to remember a large number of details. Fortunately for us there is an easy to use resource that can inform us about all the great things we can do on the command line.

### Manual pages

The manual pages are a set of pages that explain every command available on your system including what they do, the specifics of how you run them and what command line arguments they accept. Some of them are a little hard to get your head around but they are fairly consistent in their structure so once you get the hang of it it's not too bad. 

To open manual page for `ls` command, you type `man ls`.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ man ls</p>
  </div>
</div>

This command will turn your terminal into a page with a description of the `ls` command and its options.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>LS(1)</p>
    <p>&emsp;</p>
    <p>NAME</p>
    <p>&emsp;&emsp;ls - list directory content</p>
    <p>SYNOPSYS</p>
    <p>&emsp;&emsp;ls [OPTION]... [FILE]...</p>
    <p>DESCRIPTION</p>
    <p>&emsp;&emsp;List information about the FILEs (the current directory by default). Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.</p>
    <p>&emsp;</p>
    <p>&emsp;&emsp;Mandatory arguments to long options are mandatory for short options too.</p>
    <p>&emsp;</p>
    <p>&emsp;&emsp;-a, --all</p>
    <p>&emsp;&emsp;&emsp;&emsp;do not ignore entries starting with .</p>
    <p>&emsp;</p>
    <p>&emsp;&emsp;-A, --almost-all</p>
    <p>&emsp;&emsp;&emsp;&emsp;do not list implied . and ..</p>
    <p>&emsp;</p>
    <p>&emsp;&emsp;-l</p>
    <p>&emsp;&emsp;&emsp;&emsp;use a long listing format</p>
    <p>&emsp;</p>
    <p>&emsp;&emsp;-r, --reverse</p>
    <p>&emsp;&emsp;&emsp;&emsp;reverse order while sorting</p>
    <p>&emsp;</p>
    <p>&emsp;&emsp;-t</p>
    <p>&emsp;&emsp;&emsp;&emsp;sort by modification time, newest first</p>
    <p>&emsp;</p>
    <p>...</p>
  </div>
</div>

To navigate through the man pages, you may use `↑` and `↓` to move line-by-line, or try `B` and `Spacebar` to skip up and down by a full page. To search for a character or word in the `man` pages, use `/` followed by the character or word you are searching for. Sometimes a search will result in multiple hits. If so, you can move between hits using `N` (for moving forward) and `Shift+N` (for moving backward).

To **quit** the man pages, press `Q`.

### &ndash; &ndash; help

Another option, how to find out how to use a command and what options it accepts, is to pass a `--help` option to the command. It will print message similar to man page. 

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ls --help</p>
    <p>Usage: ls [OPTION]... [FILE]...</p>
    <p>List information about the FILEs (the current directory by default).</p>
    <p>Sort entries alphabetically if neither -cftuvSUX nor --sort is specified.</p>
    <p>&emsp;</p>
    <p>Mandatory arguments to long options are mandatory for short options, too.</p>
    <p>&emsp;-a, --all&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;do not ignore entries starting with .</p>
    <p>&emsp;-A, --almost-all&emsp;&emsp;do not list implied . and ..</p>
    <p>&emsp;&emsp;&emsp;&emsp;&emsp;--author&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;with -l, print the author of each file</p>
    <p>&emsp;</p>
    <p>...</p>
  </div>
</div>

### The Internet

Of course, there is a third way to access help for commands: searching the internet via your web browser. When using internet search, including the phrase `unix man page` in your search query will help to find relevant results.

## Summary

### Commands

 - **`ls`:** list a content of a directory
 - **`cd`:** change current working directory
 - **`pwd`:** print current working directory
 - **`man`:** look up the manual page for a particular command

### Concepts

 - **relative path:** a file or directory location relative to where we currently are in the file system
 - **absolute path:** a file or directory location in relation to the root of the file system

## References

[https://ryanstutorials.net/linuxtutorial/](https://ryanstutorials.net/linuxtutorial/)  
[https://btholt.github.io/complete-intro-to-linux-and-the-cli/](https://btholt.github.io/complete-intro-to-linux-and-the-cli/)  
[https://swcarpentry.github.io/shell-novice/](https://swcarpentry.github.io/shell-novice/)