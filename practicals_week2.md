# Git & GitHub

This lecture should convince you that you need to complicate your life by learning one more set of commands and use some software for taking care of your files. It's all for the greater good.

Answer these questions: 
 - Have you ever had many files of different versions of a manuscript or thesis laying around after getting feedback from your supervisor or co-authors? 
 - Have you ever wanted to experiment with your code or your manuscript and need to make a new file so that the original is not touched? 
 - Have you ever deleted something and wish you hadn’t? 
 - Have you ever forgotten what you were doing on a project? 

All these problems are fixed by using version control (git)!

![](http://www.phdcomics.com/comics/archive/phd101212s.gif)

## Key advantages of Git & GitHub

### Exposure

If someone needs to see your work or if you want them to try out your code, they can easily get it from GitHub. If they use Git, they can clone or fork your repository. If they don’t use Git, they can still browse your project on GitHub like a normal website and even grab everything by downloading a zip archive.

### History

Version control is a system that manages changes to a file or files. These changes are kept as logs in a history, with detailed information on what file(s) was changed, what was changed within the file, who changed it, and a message on why the change was made. This is extremely useful, especially when working in teams or for yourself 6 months in the future (because you will forget things)!

### Collaboration

You can pretty easily work on one project (or even one file) together with other people at the same time. Main copies of all your files are stored on the remote server and each team member can download copy to their local computer to work on it. After some experimenting and hard work, they can publish their changes to main location so everybody else can see them donwload them to their local location.

## Let's Git Started: Introduction to Git & GitHub

Git tracks the changes you make to files, so you have a record of what has been done, and you can revert to specific versions should you ever need to. 
Git also makes collaboration easier, allowing changes by multiple people to all be merged into one source. 
So regardless of whether you write code that only you will see, or work as part of a team, Git will be useful for you.

Git is the command line version control system (VCS) software which works on your local computer. You need Git to use GitHub. You can use Git locally without GitHub. GitHub is an internet hosting service for git repositories. Public repos are free; private repos are paid. As a shared space for repos, it allows you to do collaborative work.

## Some Git Terminology

### Repos and Branches

Term              | Description 
----------------- | -----------
Repository (repo) | The saved history of a folder and files, used by git.
Branch            | Pointer to a specific version of your repo.
Origin (repo)     | Your remote repo (on GitHub); it is the “origin” for your local copy. Either it is a repo you created yourself or it is a fork of someone else’s GitHub repo. 
Upstream (repo)   | The main repo (on GitHub) from which you forked your GiHub repo.
Local (repo)      | The repo on your local computer. 
Main (master)     | The main branch (version) of your repo.
Staging area      | Local place where you can put your local changes and label them before you send them to your remote repo.

### Basic acctions

Term              | Description 
----------------- | -----------
Fork              | Make a copy of someone else’s GitHub repo in your own GitHub account.
Clone             | Make a copy of the your GitHub repo on your local computer. In CLI: ‘git clone’ copies a remote repo to create a local repo with a remote called origin automatically set up.
Pull              | You incorporate changes into your repo.
Add               | Adding snapshots of your changes to the *Staging area*.
Commit            | Takes the files as they are in your *Staging area* and stores a snap shot of your files (changes) permanently in your Git directory.
Push              | You send your files (changes) to the remote repo.
Merge             | Incorporate changes into the branch you are on.
Pull Request      | Term used in collaboration. You “issue a pull request” to the owner of the upstream repo asking them to pull your changes into their repo (accept your work).
