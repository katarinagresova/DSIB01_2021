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
    <p>$ conda create -n cutadaptenv -c bioconda -c conda-forge cutadapt</p>
    <p>$ conda activate cutadaptenv</p>
    <p>(cutadaptenv)$</p>
  </div>
</div>

### Basic usage

To trim a 3’ adapter, the basic command-line for cutadapt is:

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>(cutadaptenv)$ cutadapt -a AACCGGTT -o output.fastq input.fastq</p>
  </div>
</div>

The sequence of the adapter is given with the `-a` option. You need to replace `AACCGGTT` with the correct adapter sequence. Reads are read from the input file `input.fastq` and are written to the output file `output.fastq`.

Cutadapt searches for the adapter in all reads and removes it when it finds it. Unless you use a filtering option, all reads that were present in the input file will also be present in the output file, some of them trimmed, some of them not. Even reads that were trimmed to a length of zero are output. All of this can be changed with command-line options, explained further down.

### Triming off both 5’ and 3’ adapters on both reads

Final command is quite long, so we can download it as a script.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>(cutadaptenv)$ wget https://raw.githubusercontent.com/katarinagresova/DSIB01_2021/gh-pages/assets/files/cutadapt1.sh</p>
  </div>
</div>

Let's look at the content of a script.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>(cutadaptenv)$ cat cutadapt1.sh</p>
    <p>#!/bin/bash</p>
    <p>#TODO: insert names of your downloaded files</p>
    <p>&nbsp;</p>
    <p>reads1=reads1.fastq</p>
    <p>reads2=reads2.fastq</p>
    <p>&nbsp;</p>
    <p>cutadapt -f fastq --match-read-wildcards --times 1 -e 0.1 -O 1 --quality-cutoff 6 -m 18 \  </p>
    <p>  -a NNNNNAGATCGGAAGAGCACACGTCTGAACTCCAGTCAC \  </p>
    <p>  -g CTTCCGATCTACAAGTT -g CTTCCGATCTTGGTCCT \  </p>
    <p>  -A AACTTGTAGATCGGA -A AGGACCAAGATCGGA \  </p>
    <p>  -A ACTTGTAGATCGGAA -A GGACCAAGATCGGAA \  </p>
    <p>  -A CTTGTAGATCGGAAG -A GACCAAGATCGGAAG \  </p>
    <p>  -A TTGTAGATCGGAAGA -A ACCAAGATCGGAAGA \  </p>
    <p>  -A TGTAGATCGGAAGAG -A CCAAGATCGGAAGAG \  </p>
    <p>  -A GTAGATCGGAAGAGC -A CAAGATCGGAAGAGC \  </p>
    <p>  -A TAGATCGGAAGAGCG -A AAGATCGGAAGAGCG \  </p>
    <p>  -A AGATCGGAAGAGCGT -A GATCGGAAGAGCGTC \  </p>
    <p>  -A ATCGGAAGAGCGTCG -A TCGGAAGAGCGTCGT \  </p>
    <p>  -A CGGAAGAGCGTCGTG -A GGAAGAGCGTCGTGT \  </p>
    <p>  -o reads1_trimmed.fastq -p reads2_trimmed.fastq \   </p>
    <p>  $reads1 $reads2  </p>
  </div>
</div>

### Trimming off the 3’ adapters on read 2

For eCLIP data, it was suggested to apply two rounds of adapter trimming to correct for possible double ligations events.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>(cutadaptenv)$ wget https://raw.githubusercontent.com/katarinagresova/DSIB01_2021/gh-pages/assets/files/cutadapt2.sh</p>
  </div>
</div>

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>(cutadaptenv)$ cat cutadapt2.sh</p>
    <p>#!/bin/bash</p>
    <p>&nbsp;</p>
    <p>cutadapt -f fastq --match-read-wildcards --times 1 -e 0.1 -O 5 --quality-cutoff 6 -m 18 \  </p>
    <p>  -A AACTTGTAGATCGGA -A AGGACCAAGATCGGA \  </p>
    <p>  -A ACTTGTAGATCGGAA -A GGACCAAGATCGGAA \  </p>
    <p>  -A CTTGTAGATCGGAAG -A GACCAAGATCGGAAG \  </p>
    <p>  -A TTGTAGATCGGAAGA -A ACCAAGATCGGAAGA \  </p>
    <p>  -A TGTAGATCGGAAGAG -A CCAAGATCGGAAGAG \  </p>
    <p>  -A GTAGATCGGAAGAGC -A CAAGATCGGAAGAGC \  </p>
    <p>  -A TAGATCGGAAGAGCG -A AAGATCGGAAGAGCG \  </p>
    <p>  -A AGATCGGAAGAGCGT -A GATCGGAAGAGCGTC \  </p>
    <p>  -A ATCGGAAGAGCGTCG -A TCGGAAGAGCGTCGT \  </p>
    <p>  -A CGGAAGAGCGTCGTG -A GGAAGAGCGTCGTGT \  </p>
    <p>  -o reads1_trimmed2.fastq -p reads2_trimmed2.fastq \   </p>
    <p>  reads1_trimmed.fastq reads2_trimmed.fastq  </p>
  </div>
</div>

---

[Previous page](https://katarinagresova.github.io/DSIB01_2021/preprocessing/quality.html) | [Home](https://katarinagresova.github.io/DSIB01_2021/preprocessing/) | [Next page](https://katarinagresova.github.io/DSIB01_2021/preprocessing/second_quality.html)
