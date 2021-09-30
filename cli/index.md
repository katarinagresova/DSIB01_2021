# Intro to Linux and CLI

This lesson is building on top of previous lesson and you should already have:
 - linux environment,
 - github account,
 - forked demo repository from [https://github.com/eliska-chalupova/DSIB01demo](https://github.com/eliska-chalupova/DSIB01demo),
 - local clone of forked repository.

This lesson guides you through the basics of file systems and the command line interface (cli). If you have stored files on a computer at all and recognize the word “file” and either “directory” or “folder” (two common words for the same thing), you’re ready for this lesson.

## Table of content

- [Why to learn shell?](https://katarinagresova.github.io/DSIB01_2021/cli/motivation.html)
- [Gentle introduction](https://katarinagresova.github.io/DSIB01_2021/cli/intro.html)
- [Navigating Files and Directories](https://katarinagresova.github.io/DSIB01_2021/cli/filesystem.html)

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
