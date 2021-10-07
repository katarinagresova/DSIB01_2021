# Identify unique molecular identifiers (UMIs)

Unique Molecular Identifiers (UMIs) are complex indices added to sequencing libraries before any PCR amplification steps, enabling the accurate bioinformatic identification of PCR duplicates. UMIs are especially designed for a read library, unique for each read and intentionally sequenced. UMIs were introduced since iCLIP to deal with the high duplication levels of a CLIP experiment. Because each read contain an UMI, PCR duplicates of that read also contain the same UMI, which makes it possible to fuse all reads with the same UMI.

![UMIs](https://raw.githubusercontent.com/katarinagresova/DSIB01_2021/gh-pages/assets/img/umis.png)

## Useing umi_tools to extract unique molecular barcodes



### Installing umi_tools

To install `umi_tools` in Linux environment, we can use package management tool `conda`. But first, we need to make sure that we have correct version of `python` by creating environment with `python3.7`.

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>$ conda create -n py37 python=3.7</p>
    <p>$ conda activate py37</p>
    <p>(py37)$</p>
  </div>
</div>

<div class="console">
  <header>
    <p>Terminal</p>
  </header>
  <div class="consolebody">
    <p>(py37)$ conda install -c bioconda umi_tools</p>
  </div>
</div>

---

[Previous page](https://katarinagresova.github.io/DSIB01_2021/preprocessing/quality.html) | [Home](https://katarinagresova.github.io/DSIB01_2021/preprocessing/) | [Next page](https://katarinagresova.github.io/DSIB01_2021/preprocessing/demultiplex.html)
