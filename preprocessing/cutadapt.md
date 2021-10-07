# Adapter trimming

It is often necessary to remove adapter from raw sequences. Adapters (or primers) are needed for PCR amplification and sequencing in a standard NGS protocol. Unfortunately, it might happen during the sequencing that the machine does not stop at the read end and sequences through the adapter as well. That is why, we need to check if our reads contain those sequences which we are then cutting out.

## Adapter trimming with cutadapt


### Installing cutadapt

To install `cutadapt` in Linux environment, we can use package management tool `conda`. 

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ conda install -c bioconda cutadapt</p>
  </div>
</div>

### Basic usage

To trim a 3’ adapter, the basic command-line for cutadapt is:

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ cutadapt -a AACCGGTT -o output.fastq input.fastq</p>
  </div>
</div>

The sequence of the adapter is given with the `-a` option. You need to replace `AACCGGTT` with the correct adapter sequence. Reads are read from the input file `input.fastq` and are written to the output file `output.fastq`.

Cutadapt searches for the adapter in all reads and removes it when it finds it. Unless you use a filtering option, all reads that were present in the input file will also be present in the output file, some of them trimmed, some of them not. Even reads that were trimmed to a length of zero are output. All of this can be changed with command-line options, explained further down.

---

[Previous page](https://katarinagresova.github.io/DSIB01_2021/preprocessing/quality.html) | [Home](https://katarinagresova.github.io/DSIB01_2021/preprocessing/) | [Next page](https://katarinagresova.github.io/DSIB01_2021/preprocessing/second_quality.html)
