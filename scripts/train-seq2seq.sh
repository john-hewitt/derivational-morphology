#!/bin/csh
#$ -cwd
#$ -l mem=16G
config_file=$1
output_dir=$2
seed=${3:-4}

echo "Start - `date`"
>&2 echo "Start - `date`"

mkdir -p ${output_dir}

python -m morphology.models.seq2seq \
  --config-file ${config_file} \
  --train-src data/train.src \
  --train-trg data/train.trg \
  --valid-src data/dev.src \
  --valid-trg data/dev.trg \
  --test-src data/test.src \
  --test-trg data/test.trg \
  --vocab-file data/vocab.txt \
  --unigram-counts data/unigram-counts.txt \
  --model-file ${output_dir}/seq2seq.pt \
  --train-output ${output_dir}/train.seq2seq.json \
  --valid-output ${output_dir}/valid.seq2seq.json \
  --test-output ${output_dir}/test.seq2seq.json \
  --metrics-file ${output_dir}/metrics.txt \
  --dynet-seed ${seed}

>&2 echo "Finish - `date`"
echo "Finish - `date`"
