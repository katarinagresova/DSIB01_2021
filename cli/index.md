This lesson is building on top of previous lesson and you should already have:
 - linux environment,
 - github account,
 - forked demo repository from [https://github.com/eliska-chalupova/DSIB01demo](https://github.com/eliska-chalupova/DSIB01demo),
 - local clone of forked repository.

This lesson guides you through the basics of file systems and the command line interface (cli). If you have stored files on a computer at all and recognize the word “file” and either “directory” or “folder” (two common words for the same thing), you’re ready for this lesson.

## Table of content

- [Why to learn shell?](https://katarinagresova.github.io/DSIB01_2021/cli/motivation.html)
- [Gentle introduction](https://katarinagresova.github.io/DSIB01_2021/cli/intro.html)



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
