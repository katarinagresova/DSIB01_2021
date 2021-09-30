## Interacting with Files

In previous sections we learned how to look at files and directories in our system. Now we will learn how to create, delete, rename and move them around.

### Making a Directory

Creating a directory is pretty easy. The command we are after is `mkdir` which is short for make directory. In it's most basic form we can run `mkdir` supplying only a directory and it will create it for us.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ pwd</p>
    <p>/home/student</p>
    <p>$ ls</p>
    <p>anaconda3     Documents   DSIB01demo    Pictures     snap      Videos</p>
    <p>Desktop   Downloads     Music     Public     Templates</p>
    <p>$ mkdir test_dir</p>
    <p>$ ls</p>
    <p>anaconda3     Documents   DSIB01demo    Pictures     snap     test_dir</p>
    <p>Desktop   Downloads     Music     Public     Templates    Videos</p>
  </div>
</div>

Remember that when we supply a directory in the above command we are actually supplying a path. In this case, we were using relative path.

There are a few useful options available for `mkdir`. The most used one is `-p` which tells `mkdir` to make parent directories as needed. 

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ pwd</p>
    <p>/home/student</p>
    <p>$ mkdir test_dir/foo/bar</p>
    <p>$ cd test_dir/foo/bar</p>
    <p>$ pwd</p>
    <p>/home/student/test_dir/foo/bar</p>
  </div>
</div>

To see other options, you can look into man pages.

### Good names for files and directories

Complicated names of files and directories can make your life painful when working on the command line. Here we provide a few useful tips for the names of your files and directories.

1) Don’t use spaces. Spaces can make a name more meaningful, but since spaces are used to separate arguments on the command line it is better to avoid them in names of files and directories. You can use `-` or `_` instead (e.g. `north-pacific-gyre/` rather than `north pacific gyre/`). To test this out, try typing `mkdir north pacific gyreand` see what directory (or directories!) are made.

2) Don’t begin the name with `-` (dash). Commands treat names starting with `-` as options.

3) Stick with letters, numbers, `.` (period or ‘full stop’), `-` (dash) and `_` (underscore). Many other characters have special meanings on the command line.  There are special characters that can cause your command to not work as expected and can even result in data loss.

If you need to refer to names of files or directories that have spaces or other special characters, you should surround the name in quotes (`""`).

### Removing a Directory

The command to remove a directory is `rmdir`, short for remove directory. This will remove an empty directory and it also support a `-p` option to remove parent directories as well. One thing to note, however, is that there is no undo when it comes to the command line on Linux (Linux GUI desktop environments typically do provide an undo feature but the command line does not). Just be careful with what you do.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ cd</p>
    <p>$ pwd</p>
    <p>/home/student</p>
    <p>$ ls test_dir/foo</p>
    <p>bar</p>
    <p>$ rmdir test_dir/foo/bar</p>
    <p>$ ls test_dir/foo</p>
    <p>&emsp;</p>
  </div>
</div>

### Creating a File
  
One way to create a file is to open it in a text editor - text editor will create this file if doesn't exist. Let's use text editor called `nano`.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ cd test_dir</p>
    <p>$ nano draft.txt</p>
  </div>
</div> 

Let’s type in a few lines of text. Once we’re happy with our text, we can press `Ctrl`+`O` to write our data to disk (we’ll be asked what file we want to save this to: press `Return` to accept the suggested default of `draft.txt`). Once our file is saved, we can use `Ctrl`+`X` to quit the editor and return to the shell.

`nano` doesn’t leave any output on the screen after it exits, but `ls` now shows that we have created a file called `draft.txt`


<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ ls</p>
    <p>draft.txt</p>
  </div>
</div> 

### Moving Files and Directories

The command we use for this is `mv` which stands for **move**. `mv` takes to parameters: source and destination. Note that both the source and destination are paths. This means we may refer to them using both absolute and relative paths.


<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ mv draft.txt foo/</p>
    <p>$ ls foo</p>
    <p>draft.txt</p>
  </div>
</div> 

When destination argument is directory, specified file is moved into this directory and its name is not changed. 

We might also use `mv` for renaming files. We specify destination as part to a file. One must be careful when specifying the target file name, since mv will silently overwrite any existing file with the same name, which could lead to data loss. An additional option, `mv -i` (or `mv --interactive`), can be used to make mv ask you for confirmation before overwriting.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ mv foo/draft.txt foo/text.txt</p>
    <p>$ ls foo</p>
    <p>text.txt</p>
  </div>
</div> 

### Copying Files and Directories

The `cp` command works very much like `mv`, except it copies a file instead of moving it. We can check that it did the right thing using `ls` with two paths as arguments — like most Unix commands, ls can be given multiple paths at once.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ cp foo/text.txt notes.txt</p>
    <p>$ ls foo/text.txt notes.txt</p>
    <p>foo/text.txt notes.txt</p>
  </div>
</div> 

We can also copy a directory and all its contents by using the recursive option `-r`, e.g. to back up a directory.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ cp -r foo backup_foo</p>
    <p>$ ls foo backup_foo</p>
    <p>backup_foo:</p>
    <p>text.txt</p>
    <p>&emsp;</p>
    <p>foo:</p>
    <p>text.txt</p>
  </div>
</div> 

---

[Previous page](https://katarinagresova.github.io/DSIB01_2021/cli/filesystem.html) | [Home](https://katarinagresova.github.io/DSIB01_2021/cli/index.html) | Next page
