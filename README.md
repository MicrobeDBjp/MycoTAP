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



## 【暫定】test.sifの作成
test.sifが118MBあり、ファイルサイズ上限の25MB以上なのでgithubに直接はアップロードできません。

最終的にはsingularityhub(イメージファイル置き場)に登録するべきですが、暫定の作成方法を記載します。

以下の作業はスパコン上ではなく、sudoが実行可能なローカルサーバーで行う必要があります。

[Local server]$ git clone https://(ユーザー名):(パーソナルアクセストークン)@github.com/MicrobeDBjp/MycoTAP.git  .

[Local server]$ docker build -t test .

[Local server]$ sudo singularity build test.sif docker-daemon/test:latest

test.sifをローカルサーバーからスパコン上にコピーする。


## スパコン上での実行方法(非git clone)
[at 139 ~]$ SINGULARITYENV_PATH=/home/geadmin/UGER/bin/lx-amd64:/opt/pkg/singularity/3.7.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin singularity exec -B /home/geadmin/ -B /lustre6/public/app/myco-tap/ /lustre6/public/app/myco-tap/MycoTAP-dev20210707.sif qsub /usr/local/bin/MycoTAPNIGSuper.sh /lustre6/public/app/myco-tap/DRR053508_1.fastq.gz $HOME/result/

## （旧）スパコン上での実行方法(git cloneしたフォルダーに依存していた7/6までのバージョン)
[at 139 ~]$ mkdir test_dir && cd test_dir

[at 139 test_dir ]$ git clone https://(ユーザー名):(パーソナルアクセストークン)@github.com/MicrobeDBjp/MycoTAP.git  .

or sshに設定したうえで

[at 139 test_dir]$ git clone git@github.com:MicrobeDBjp/MycoTAP.git


[at 139 test_dir]$ mkdir result

[at139 test_dir]$ SINGULARITYENV_PATH=/home/geadmin/UGES/bin/lx-amd64:/opt/pkg/singularity/3.7.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin singularity exec -B /home/geadmin/ MycoTAP-dev.sif qsub ForSuperComputer/MycoTAPNIGSuper.sh DRR053508_1.fastq.gz result/
