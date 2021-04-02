# MycoTAP
Fungal ITS analysis pipeline for MicrobeDB.jp

## Usage for NIG SuperComputer

```bash
qsub -l s_vmem=10G -l mem_req=10G -l /home/hoge/MycoTAP/MycoTAPNIGSuper.sh /home/hoge/DRR053508_1.fastq /home/hoge/MycoTAPRes1
```
/home/hoge/DRR053508_1.fastq is a query fastq file for the Fungi ITS analysis.

/home/hoge/MycoTAPRes1 is an output directory of the MycoTAP result.

You need to edit UNITEREF1, UNITEREF2, and PROGRAMDIR in MycoTAPNIGSuper.sh 
