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

---

[Previous page](https://katarinagresova.github.io/DSIB01_2021/cli/motivation.html) | [Home](https://katarinagresova.github.io/DSIB01_2021/cli/index.html) | [Next page](https://katarinagresova.github.io/DSIB01_2021/cli/filesystem.html)
