## Exercise

Goal of this exercise is to get data that will be used in future practicals. While doing so, you will practice command line and git commands.

- go to [Encode database with eClip data](https://www.encodeproject.org/search/?type=Experiment&control_type!=*&assay_term_name=eCLIP&replicates.library.biosample.donor.organism.scientific_name=Homo%20sapiens&biosample_ontology.term_name=HepG2&status=released) and pick one experiment
- update README.md file with ulr of chosen experiment
- write shell script that will:
  - create directory for data
  - download data from selected experiment
    - *hint: look at `wget` command*
  - unzip downloaded files
    - *hint: look at `tar` command*
  - delete zip files
- run created script to download data
- push script to github
  - *hint: look at [Adding a file to a repository using the command line](https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository#adding-a-file-to-a-repository-using-the-command-line)*
- examine downloaded files
  - look at content
    - *hint: look at `head` command*

---

[Home](https://katarinagresova.github.io/DSIB01_2021/cli/index.html)
