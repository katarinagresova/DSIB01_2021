## Quality control

During sequencing, the nucleotide bases in a DNA or RNA sample (library) are determined by the sequencer. For each fragment in the library, a short sequence is generated, also called a read, which is simply a succession of nucleotides.

Modern sequencing technologies can generate a massive number of sequence reads in a single experiment. However, no sequencing technology is perfect, and each instrument will generate different types and amount of errors, such as incorrect nucleotides being called. These wrongly called bases are due to the technical limitations of each sequencing platform.

Therefore, it is necessary to understand, identify and exclude error-types that may impact the interpretation of downstream analysis. Sequence quality control is therefore an essential first step in your analysis. Catching errors early saves time later on.

## Assessing quality with FastQC

To take a look at sequence quality along all sequences, we can use [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/). It provides a modular set of analyses which you can use to check whether your data has any problems of which you should be aware before doing any further analysis. We can use it, for example, to assess whether there are known adapters present in the data.

### Installing FastQC

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ sudo apt install fastqc</p>
    <p>sudo password for student:</p>
  </div>
</div>

### Per base sequence quality

### Adapter Content

### Per sequence quality scores

### Per base sequence content

### Per sequence GC content

### Sequence length distribution

### Sequence Duplication Levels

---

[Previous page](https://katarinagresova.github.io/DSIB01_2021/preprocessing/) | [Home](https://katarinagresova.github.io/DSIB01_2021/preprocessing/) | [Next page](https://katarinagresova.github.io/DSIB01_2021/preprocessing/umi.html)