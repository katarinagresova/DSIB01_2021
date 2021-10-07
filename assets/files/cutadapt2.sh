#!/bin/bash

cutadapt --match-read-wildcards --times 1 -e 0.1 -O 5 --quality-cutoff 6 -m 18 \
-A AACTTGTAGATCGGA -A AGGACCAAGATCGGA \
-A ACTTGTAGATCGGAA -A GGACCAAGATCGGAA \
-A CTTGTAGATCGGAAG -A GACCAAGATCGGAAG \
-A TTGTAGATCGGAAGA -A ACCAAGATCGGAAGA \
-A TGTAGATCGGAAGAG -A CCAAGATCGGAAGAG \
-A GTAGATCGGAAGAGC -A CAAGATCGGAAGAGC \
-A TAGATCGGAAGAGCG -A AAGATCGGAAGAGCG \
-A AGATCGGAAGAGCGT -A GATCGGAAGAGCGTC \
-A ATCGGAAGAGCGTCG -A TCGGAAGAGCGTCGT \
-A CGGAAGAGCGTCGTG -A GGAAGAGCGTCGTGT \
-o reads1_trimmed2.fastq -p reads2_trimmed2.fastq \
reads1_trimmed.fastq reads2_trimmed.fastq
