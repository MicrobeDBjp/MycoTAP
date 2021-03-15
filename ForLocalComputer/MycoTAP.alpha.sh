fastp -i "$1" -o  "$1".rem.fastq -G -3 -n 1 -l 90 -w 1 -x
seqkit fq2fa "$1".rem.fastq > "$1".rem.fastq.fasta
vsearch-2.15.0-linux-x86_64/bin/vsearch --usearch_global "$1".rem.fastq.fasta --db UNITERefS.20200204.fasta.withspecies.fasta --id 0.97 --query_cov 0.8 --strand both --blast6out "$1".rem.fastq.fasta.UNITE.97withspecies
perl NameSum.pl "$1".rem.fastq.fasta.UNITE.97withspecies
vsearch-2.15.0-linux-x86_64/bin/vsearch --usearch_global "$1".rem.fastq.fasta --db UNITERefS.20200204.fasta.sp.fasta --id 0.97 --query_cov 0.8 --strand both --blast6out "$1".rem.fastq.fasta.UNITE.97nospecies
perl NameSumSp.pl "$1".rem.fastq.fasta.UNITE.97nospecies
perl RemoveKasanari.pl "$1".rem.fastq.fasta.UNITE.97nospecies "$1".rem.fastq.fasta.UNITE.97withspecies
perl NameSumSp.pl "$1".rem.fastq.fasta.UNITE.97nospecies.withoutkasanari
