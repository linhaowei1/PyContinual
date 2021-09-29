#!/bin/bash

if [ ! -d "OutputBert" ]; then
  mkdir OutputBert
fi

for id in 2 3
do
    CUDA_VISIBLE_DEVICES=0 python  run.py \
    --bert_model 'bert-base-uncased' \
    --experiment bert \
    --approach bert_kim_ncl \
    --note random$id,sup \
    --ntasks 19 \
    --task asc \
    --scenario til_classification \
    --idrandom $id \
    --output_dir './OutputBert' \
    --eval_batch_size 128 \
    --nepochs=100 \
    --lr=0.1 \
    --lr_min=1e-4 \
    --lr_factor=3 \
    --lr_patience=3 \
    --clipgrad=10000 \
    --temp 1 \
    --base_temp 1 \
    --sup_loss
done
#--nepochs 1