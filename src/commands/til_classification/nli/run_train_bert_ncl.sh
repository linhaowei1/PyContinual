#!/bin/bash
#SBATCH -p gpu20
#SBATCH -t 30:00:00
#SBATCH -o til_nli_ncl_1-%j.out
#SBATCH --gres gpu:1

for id in 0 1 2 3 4
do
    python  run.py \
    --bert_model 'bert-base-uncased' \
    --experiment bert \
    --note random$id,2000 \
    --ntasks 5 \
    --task nli \
    --scenario til_classification \
    --idrandom $id \
    --output_dir './OutputBert' \
    --approach bert_ncl \
    --eval_batch_size 128 \
    --num_train_epochs 10 \
    --train_data_size 2000 \
    --dev_data_size 2000
done
#--nepochs 1
#    --train_batch_size 64 \
#    --train_data_size 500 \
#    --model_path "./models/fp32/til_classification/nli/ncl_$id" \
#    --save_model