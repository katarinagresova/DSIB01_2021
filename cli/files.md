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

## Removing a Directory

The command to remove a directory is `rmdir`, short for remove directory. This will remove an empty directory and it also support a `-p` option to remove parent directories as well. One thing to note, however, is that there is no undo when it comes to the command line on Linux (Linux GUI desktop environments typically do provide an undo feature but the command line does not). Just be careful with what you do.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ cd<.p>
    <p>$ pwd</p>
    <p>/home/student</p>
    <p>$ ls test_dir/foo</p>
    <p>bar</p>
    <p>$ rmdir test_dir/foo/bar</p>
    <p>$ ls test_dir/foo</p>
    <p>&emsp;</p>
  </div>
</div>

