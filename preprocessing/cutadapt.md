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

Whole `cutadapt` command is quite long, so we can download it as a script.

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
    <p>cutadapt --match-read-wildcards --times 1 -e 0.1 -O 1 --quality-cutoff 6 -m 18 \  </p>
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

Firs, we need to specify names of files with our raw sequences. Then we can run `cutadapt` command. We have several parameters there:
- **`--match-read-wildcards`:** 
  - Wildcard characters (IUPAC nucleotide codes) are by default only allowed in adapter sequences and are not recognized when they occur in a read. `--match-read-wildcards` enablse wildcards also in reads.
- **`--times 1`:**
  - By default, at most one adapter sequence is removed from each read, even if multiple adapter sequences were provided. This can be changed by using the `--times` option). Cutadapt will then search for all the given adapter sequences repeatedly, either until no adapter match was found or until the specified number of rounds was reached.
- **`-e 0.1`:** 
  - The `-e` option on the command line allows you to change the maximum error rate. If the value is between `0` and `1` (but not `1` exactly), then this sets the maximum error rate directly for all specified adapters. The default is `-e 0.1`. Alternatively, you can also specify a value of `1` or greater as the number of allowed errors, which is then converted to a maximum error rate for each adapter individually. For example, with an adapter of length `10`, using `-e 2` will set the maximum error rate to `0.2` for an adapter of length `10`.
- **`-O 1`:** 
  - Since Cutadapt allows partial matches between the read and the adapter sequence, short matches can occur by chance, leading to erroneously trimmed bases. For example, roughly `25%` of all reads end with a base that is identical to the first base of the adapter. To reduce the number of falsely trimmed bases, the alignment algorithm requires that, by default, at least three bases match between adapter and read. This minimum overlap length can be changed globally (for all adapters) with the parameter `-O`. 
- **`--quality-cutoff 6`:** 
  - The `--quality-cutoff` parameter can be used to trim low-quality ends from reads. If you specify a single cutoff value, the `3’` end of each read is trimmed. For Illumina reads, this is sufficient as their quality is high at the beginning, but degrades towards the `3’` end. It is also possible to also trim from the `5’` end by specifying two comma-separated cutoffs as `5’ cutoff`,`3’ cutoff`. Quality trimming is done before any adapter trimming.
- **`-m 18`:** 
  - The `-m` parameter discard processed reads that are shorter than `LENGTH`. If you do not use this option, reads that have a length of zero (empty reads) are kept in the output. Some downstream tools may have problems with zero-length sequences. In that case, specify at least `-m 1`.
- **`-a NNNNNAGATCGGAAGAGCACACGTCTGAACTCCAGTCAC`:** 
  - The `-a` parameter specifies `3’` adapter in forward read.
- **`-g CTTCCGATCTACAAGTT`:** 
  - The `-g` parameter specifies `5’` adapter in forward read.
- **`-A AACTTGTAGATCGGA`:** 
  - The `-A` parameter specifies `3’` adapter in reverse read.
- **`-o reads1_trimmed.fastq`:** 
  - By default, all processed reads, no matter whether they were trimmed or not, are written to the output file specified by the `-o` option.
- **`-p reads2_trimmed.fastq`:** 
  - For paired-end reads, the second read in a pair is always written to the file specified by the `-p` option.
- **`$reads1`:** 
  - Input file with forward reads.
- **`$reads2`:** 
  - Input file with reverse reads.

Specific parameters and their values were taken from eCLIP-seq Processing Pipeline Protocol, Yeo Lab, UCSD, [https://www.encodeproject.org/documents/739ca190-8d43-4a68-90ce-1a0ddfffc6fd/@@download/attachment/eCLIP_analysisSOP_v2.2.pdf](https://www.encodeproject.org/documents/739ca190-8d43-4a68-90ce-1a0ddfffc6fd/@@download/attachment/eCLIP_analysisSOP_v2.2.pdf)

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
    <p>cutadapt --match-read-wildcards --times 1 -e 0.1 -O 5 --quality-cutoff 6 -m 18 \  </p>
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

Specific parameters and their values were taken from eCLIP-seq Processing Pipeline Protocol, Yeo Lab, UCSD, [https://www.encodeproject.org/documents/739ca190-8d43-4a68-90ce-1a0ddfffc6fd/@@download/attachment/eCLIP_analysisSOP_v2.2.pdf](https://www.encodeproject.org/documents/739ca190-8d43-4a68-90ce-1a0ddfffc6fd/@@download/attachment/eCLIP_analysisSOP_v2.2.pdf)

---

[Previous page](https://katarinagresova.github.io/DSIB01_2021/preprocessing/quality.html) | [Home](https://katarinagresova.github.io/DSIB01_2021/preprocessing/) | [Next page](https://katarinagresova.github.io/DSIB01_2021/preprocessing/second_quality.html)
