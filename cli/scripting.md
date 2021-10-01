## Scripting

Script is a document telling computer what to do. 
A script is just a plain text file and it may have any name you like. You create them the same way you would any other text file, with just a plain old text editor.
Anything you can run on the command line you may place into a script and they will behave exactly the same. 
Vice versa, anything you can put into a script, you may run on the command line and again it will perform exactly the same.

Not only will writing shell scripts make your work faster — you won’t have to retype the same commands over and over again — it will also make it more accurate (fewer chances for typos) and more reproducible. If you come back to your work later (or if someone else finds your work and wants to build on it) you will be able to reproduce the same results simply by running your script, rather than having to remember or retype a long list of commands.

### Your first script

This script will print a message to the screen (using a program called echo) then give us a listing of what is in our current directory.
Linux is an extensionless system so it is not required for scripts to have a .sh extension. It is common to put them on however to make them easy to identify.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ cd ~/test_dir</p>
    <p>$ nano myscript.sh</p>
  </div>
</div> 

The very first line of a script should always be this line. This line identifies which interpreter should be used. The first two characters are referred to as a **shebang**. After that (important, no spaces) is the path to the interpreter.
Anything following a `#` is a comment. The interpreter will not run this, it is just here for our benefit. It is good practice to include your name, and the date you wrote the script as well as a one line quick description of what it does at the top of the script.
We'll use a program called `echo` It will merely print whatever you place after it, as command line arguments, to the screen. Useful for printing messages.
`ls` is a command that is writing to command line. Even when used in script, it will still write to command line.

<div class="console">
  <header>
    <p>Nano</p>
  </header>
  <div class="consolebody">
    <p>#!/bin/bash</p>
    <p># A simple demonstration script</p>
    <p># Gresova 1.10.2021</p>
    <p>&emsp;</p>
    <p>echo Here are the files in your current directory:</p>
    <p>ls</p>
  </div>
</div> 

To run our script, we need to specify path to it. We can use relative path `./myscritp.sh` or absobute path `/home/student/test_dir/myscript.sh`.
  
<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ./myscript.sh</p>
    <p>Here are the files in your current directory:</p>
    <p>foo myscript.sh</p>
  </div>
</div>
 
### Variables

A variable is a container for a simple piece of data. They are useful if we need to work out a particular thing and then use it later on. Variables are easy to set and refer to but they have a specific syntax that must be followed exactly for them to work.

- When we set a variable, we specify it's name, followed directly by an equals sign (`=`) followed directly by the value. (So, no spaces on either side of the `=` sign.)
- When we refer to a variable, we must place a dollar sign (`$`) before the variable name.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ nano variable.sh</p>
  </div>
</div> 

<div class="console">
  <header>
    <p>Nano</p>
  </header>
  <div class="consolebody">
    <p>#!/bin/bash</p>
    <p># A simple demonstration of variables</p>
    <p># Gresova 1.10.2021</p>
    <p>&emsp;</p>
    <p>name='Katarina'</p>
    <p>echo Hello $name</p>
  </div>
</div> 

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ./variables.sh</p>
    <p>Hello Katarina</p>
  </div>
</div>
