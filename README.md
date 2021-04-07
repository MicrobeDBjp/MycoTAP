# MycoTAP
Fungal ITS analysis pipeline for MicrobeDB.jp

## Usage for NIG SuperComputer

```bash
qsub -l s_vmem=10G -l mem_req=10G /home/hoge/MycoTAP/MycoTAPNIGSuper.sh /home/hoge/DRR053508_1.fastq /home/hoge/MycoTAPRes1
```
/home/hoge/DRR053508_1.fastq is a query fastq file for the Fungi ITS analysis.

/home/hoge/MycoTAPRes1 is an output directory of the MycoTAP result.

Please replace hoge with your user name.

You need to edit UNITEREF1, UNITEREF2, and PROGRAMDIR in MycoTAPNIGSuper.sh 

## Usage for local Linux server

```bash
./MycoTAPLocal.sh /home/hoge/DRR053508_1.fastq /home/hoge/MycoTAPRes1
```
/home/hoge/DRR053508_1.fastq is a query fastq file for the Fungi ITS analysis.

/home/hoge/MycoTAPRes1 is an output directory of the MycoTAP result.

Please replace hoge with your user name.

You need to edit UNITEREF1, UNITEREF2, and PROGRAMDIR in MycoTAPNIGSuper.sh 

You need to install **fastp**, **seqkit**, and **vsearch** on yourself, and **need to add symbolic link to the PROGRAMDIR**.

You can speedup the MycoTAPLocal calculation by increasing THREAD (default MycoTAPLocal uses 10 threads).


# 重要な出力結果ファイル
\*.UNITE.97withspecies.species.txt	種組成

\*.UNITE.97nospecies.withoutdup.species.txt	種までは推定できなかった系統の組成

**ただし、種組成をどの程度正確に推定できているかは現在検証中なので、使用には注意が必要**
