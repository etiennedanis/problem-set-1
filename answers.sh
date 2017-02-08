#! /usr/bin/env bash 

datasets="$HOME/data/MOLB7621/data-sets"

# Question 1: Which state has the lowest crime rate?

states=$datasets/misc/states.tab.gz

answer_1=$(zcat $states \
    | grep -v '^#' \
    | cut -f 1,6 \
    | sort -k2g \
    | head -n1 \
    | cut -f1 \
    | tr -d '"') 

echo answer-1: $answer_1  


# Question 2: How many sequence records are in the sample.fa file?

fasta=$datasets/fasta/sample.fa

answer_2=$(grep -c "^>" $fasta)

echo answer-2: $answer_2


# Question 3: How many unique CpG IDs are in cpg.bed.gz?

CpG=$datasets/bed/cpg.bed.gz

answer_3=$(zcat $CpG \
    | cut -f4 \
    | sort \
    | uniq -c \
    | wc -l)

echo answer-3: $answer_3


# Question 4: How many sequence records are in the SP1.fq file?

SP1=$datasets/fastq/SP1.fq

answer_4=$(grep -c '^@cluster' $SP1)

echo answer-4: $answer_4


# Question 5: How many words are on lines containing the word bloody in hamlet.txt? (Hint: use wc to count words).

Hamlet=$datasets/misc/hamlet.txt

answer_5=$(grep -i 'bloody' $Hamlet| wc -w)

echo answer-5: $answer_5


# Question 6: What is the length of the sequence in the first record of sample.fa? (Hint: use wc to count characters).

fasta=$datasets/fasta/sample.fa

answer_6=$(grep -v '^>' $fasta \
    | head -n1 \
    | tr -d '\n'\
    | wc -c)

echo answer-6: $answer_6


# Question 7: What is the name of the longest gene in genes.hg19.bed.gz?

hg19=$datasets/bed/genes.hg19.bed.gz

answer_7=$(zcat $hg19 \
    | awk 'BEGIN {OFS="\t"} {print $0, $3 - $2}' \
    | sort -k7nr \
    | cut -f4 \
    | head -n1) 

echo answer-7: $answer_7


# Question 8: How many unique chromosomes are in genes.hg19.bed.gz?

hg19=$datasets/bed/genes.hg19.bed.gz

answer_8=$(zcat $hg19 \
    | cut -f1 \
    | sort \
    | uniq \
    | wc -l)

echo answer-8: $answer_8


# Question 9: How many intervals are associated with CTCF (not CTCFL) in peaks.chr22.bed.gz?

peaks=$datasets/bed/peaks.chr22.bed.gz

answer_9=$(zcat $peaks \
    | cut -f4 \
    | grep -w 'CTCF' \
    | wc -l) 

echo answer-9: $answer_9


# Question 10: On what chromosome is the largest interval in lamina.bed?

lamina=$datasets/bed/lamina.bed

answer_10=$(cat $lamina \
    | awk 'BEGIN {OFS="\t"} {print $0, $3 - $2}' \
    | sort -k5nr \
    | cut -f1 \
    | head -n1)

echo answer-10: $answer_10
