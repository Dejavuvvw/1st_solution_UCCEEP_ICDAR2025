nnodes=8
nproc_per_node=8

MAX_PIXELS=1003520 \
CUDA_VISIBLE_DEVICES=0,1,2,3,5,6,7 \
torchrun \
    --master_port 29500 \
    --nproc_per_node=$nproc_per_node \
    --nnodes=$nnodes \
    --node_rank=1 \
    --master_addr=xxx.xxx.xxx.xxx \
    swift/cli/sft.py \
    --model Qwen/Qwen2.5-VL-3B-Instruct \
    --train_type full \
    --dataset 'xxxxxx' \
    --torch_dtype bfloat16 \
    --num_train_epochs 10 \
    --per_device_train_batch_size 32 \
    --per_device_eval_batch_size 32 \
    --learning_rate 6e-6 \
    --gradient_accumulation_steps $(expr 32 / $nproc_per_node / $nnodes) \
    --eval_steps 100 \
    --save_steps 100 \
    --save_total_limit 2 \
    --logging_steps 5 \
    --output_dir output \
    --warmup_ratio 0.05 \
    --dataloader_num_workers 16 \
    --deepspeed zero3-offload \
    --max_new_token 3000 \
    --attn_impl flash_attn \
    --custom_data_aug \
    --dynamic_ocr \
    --mode0_prob 0.9 \
    --num_img_to_ocr 1 \
    --remove_unused_columns false \
    --seed 42
