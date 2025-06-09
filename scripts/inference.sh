MODEL='YOUR MODEL'
VAL_DATA='/app/TestA_promptNew.jsonl'
CUDA_VISIBLE_DEVICES=0,1,2,3 \
MAX_PIXELS=802816 \
swift infer \
    --model $MODEL \
    --infer_backend pt \
    --stream false \
    --temperature 0.01 \
    --top_k 1 \
    --top_p 0.001 \
    --max_new_tokens 50000 \
    --val_dataset $VAL_DATA \
    --remove_unused_columns false \
    --attn_impl flash_attn \
    --max_batch_size 1
