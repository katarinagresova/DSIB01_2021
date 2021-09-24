This lesson guides you through the basics of file systems and the command line interface (cli). If you have stored files on a computer at all and recognize the word “file” and either “directory” or “folder” (two common words for the same thing), you’re ready for this lesson.

## Why to learn Shell?

### Command-line interface vs Graphical user interface

Humans and computers commonly interact in many different ways, such as through a keyboard and mouse, touch screen interfaces, or using speech recognition systems. The most widely used way to interact with personal computers is called a **graphical user interface** (GUI). With a GUI, we give instructions by clicking a mouse and using menu-driven interactions.

While the visual aid of a GUI makes it intuitive to learn, this way of delivering instructions to a computer scales very poorly. Imagine the following task: for a literature search, you have to copy the third line of one thousand text files in one thousand different directories and paste it into a single file. Using a GUI, you would not only be clicking at your desk for several hours, but you could potentially also commit an error in the process of completing this repetitive task. This is where we take advantage of the Unix shell. The Unix shell is both a **command-line interface** (CLI) and a scripting language, allowing such repetitive tasks to be done automatically and fast. With the proper commands, the shell can repeat tasks with or without some modification as many times as we want. Using the shell, the task in the literature example can be accomplished in seconds.

### The Shell

The shell is a program where users can type commands. With the shell, it’s possible to invoke complicated programs like climate modeling software or simple commands that create an empty directory with only one line of code. The most popular Unix shell is Bash (the Bourne Again SHell — so-called because it’s derived from a shell written by Stephen Bourne). Bash is the default shell on most modern implementations of Unix and in most packages that provide Unix-like tools for Windows.

Using the shell will take some effort and some time to learn. While a GUI presents you with choices to select, CLI choices are not automatically presented to you, so you must learn a few commands like new vocabulary in a language you’re studying. However, unlike a spoken language, a small number of “words” (i.e. commands) gets you a long way, and we’ll cover those essential few today.

In addition, the command line is often the easiest way to interact with remote machines and supercomputers. Familiarity with the shell is near essential to run a variety of specialized tools and resources including high-performance computing systems. As clusters and cloud computing systems become more popular for scientific data crunching, being able to interact with the shell is becoming a necessary skill. We can build on the command-line skills covered here to tackle a wide range of scientific questions and computational challenges.

### Nelle’s Pipeline: A Typical Problem

Nelle Nemo, a marine biologist, has just returned from a six-month survey of the North Pacific Gyre, where she has been sampling gelatinous marine life in the Great Pacific Garbage Patch. She has 1520 samples that she’s run through an assay machine to measure the relative abundance of 300 proteins. She needs to run these 1520 files through an imaginary program called `goostats.sh` she inherited. On top of this huge task, she has to write up results by the end of the month so her paper can appear in a special issue of Aquatic Goo Letters.

The bad news is that if she has to run `goostats.sh` by hand using a GUI, she’ll have to select and open a file 1520 times. If `goostats.sh` takes 30 seconds to run each file, the whole process will take more than 12 hours of Nelle’s attention. With the shell, Nelle can instead assign her computer this mundane task while she focuses her attention on writing her paper.

The next few lessons will explore the ways Nelle can achieve this. More specifically, they explain how she can use a command shell to run the goostats.sh program, using loops to automate the repetitive steps of entering file names, so that her computer can work while she writes her paper.

As a bonus, once she has put a processing pipeline together, she will be able to use it again whenever she collects more data.

In order to achieve her task, Nelle needs to know how to:

 - navigate to a file/directory
 - create a file/directory
 - check the length of a file
 - chain commands together
 - retrieve a set of files
 - iterate over files
 - run a shell script containing her pipeline

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
    <p>Desktop     Downloads   Movies      Pictures</p>
    <p>Documents   Library     Music       Public</p>
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

## Navigating Files and Directories

The part of the operating system responsible for managing files and directories is called the **file system**. It organizes our data into files, which hold information, and directories (also called ‘folders’), which hold files or other directories.

First, let’s find out where we are by running a command called `pwd` (which stands for ‘print working directory’). Directories are like places — at any time while we are using the shell, we are in exactly one place called our **current working directory**. Commands mostly read and write files in the current working directory, i.e. ‘here’, so knowing where you are before running a command is important. `pwd` shows you where you are:

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ pwd</p>
    <p>/Users/student</p>
  </div>
</div>

Here, the computer’s response is `/Users/student`, which is our home directory.

### File system

To understand what a **home directory** is, let’s have a look at how the file system as a whole is organized. For the sake of this example, we’ll be illustrating the filesystem in a simplified view.

![](https://github.com/katarinagresova/DSIB01_2021/raw/gh-pages/assets/img/file_system.png)

At the top is the **root directory** that holds everything else. We refer to it using a slash character, `/`, on its own; this character is the leading slash in `/Users/student`.

Inside that directory are several other directories: `bin` (which is where some built-in programs are stored), `data` (for miscellaneous data files), `Users` (where users’ personal directories are located), `tmp` (for temporary files that don’t need to be stored long-term), and so on.

We know that our current working directory `/Users/student` is stored inside `/Users` because `/Users` is the first part of its name. Similarly, we know that `/Users` is stored inside the root directory `/` because its name begins with `/`.
