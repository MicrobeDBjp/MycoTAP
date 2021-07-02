#!/bin/sh
#$ -S /bin/sh
#$ -cwd
# USAGE: this_shell_script input_file output_dir
# input_file=$1
# output_dir=$2
UNITEREF1=$PWD/MycoTAP-main/UNITERefS.20200204.fasta.withspecies.fasta.NoN.fasta
UNITEREF2=$PWD/MycoTAP-main/UNITERefS.20200204.fasta.sp.fasta.NoN.fasta
PROGRAMDIR=$PWD/MycoTAP-main

export PATH=/opt/pkg/singularity/3.7.1/bin:$PATH
export PATH=/home/geadmin/UGER/bin/lx-amd64:$PATH

THREAD=1
LOGFILE="$2/mycotap.log"
if [ $# -ne 2 ]; then
  echo "you specified $# arguments." 1>&2
  echo "But this program can only use 2 arguments." 1>&2
  exit 1
fi
if [ ! -f $1 ]; then
	echo "No $1 file exist." 1>&2
	exit 1
fi
if [ ! -d $2 ]; then
	echo "$2 directory does not exist. please mkdir" 1>&2
	exit 1
fi

touch $LOGFILE
 if [ ! -f $LOGFILE ]; then
  echo "Error cannot create $LOGFILE."
  exit 1;
fi

{
DE0=`basename "$1"`
cp "$1" "$2/$DE0"
singularity exec /usr/local/biotools/f/fastp\:0.20.1--h8b12597_0 fastp -i $2/$DE0 -o $2/$DE0.rem.fastq -G -3 -n 1 -l 90 -w 1 -x
singularity exec /usr/local/biotools/s/seqkit\:0.13.2--0 seqkit fq2fa $2/$DE0.rem.fastq > $2/$DE0.rem.fastq.fasta
singularity exec /usr/local/biotools/v/vsearch\:2.15.2--h2d02072_0 vsearch --usearch_global $2/$DE0.rem.fastq.fasta --db $UNITEREF1 --id 0.97 --query_cov 0.8 --strand both --blast6out $2/$DE0.rem.fastq.fasta.UNITE.97withspecies --threads $THREAD
perl $PROGRAMDIR/NameSum.pl $2/$DE0.rem.fastq.fasta.UNITE.97withspecies
singularity exec /usr/local/biotools/v/vsearch\:2.15.2--h2d02072_0 vsearch --usearch_global $2/$DE0.rem.fastq.fasta --db $UNITEREF2 --id 0.97 --query_cov 0.8 --strand both --blast6out $2/$DE0.rem.fastq.fasta.UNITE.97nospecies --threads $THREAD
perl $PROGRAMDIR/NameSum.pl $2/$DE0.rem.fastq.fasta.UNITE.97nospecies
perl $PROGRAMDIR/RemoveNameDup.pl $2/$DE0.rem.fastq.fasta.UNITE.97nospecies $2/$DE0.rem.fastq.fasta.UNITE.97withspecies
perl $PROGRAMDIR/NameSum.pl $2/$DE0.rem.fastq.fasta.UNITE.97nospecies.withoutdup
rm -f $2/$DE0.rem.fastq
rm -f $2/$DE0.rem.fastq.fasta
} >> "$LOGFILE" 2>&1
