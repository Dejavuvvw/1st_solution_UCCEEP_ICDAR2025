# 80GB
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7

NNODES=8
NODE_RANK=0
MASTER_ADDR="0.0.0.0"
MASTER_PORT=8999

which torchrun
torchrun \
    --nproc_per_node 8 \
    --nnodes="${NNODES}" \
    --node_rank="${NODE_RANK}" \
    --master_addr="${MASTER_ADDR}" \
    --master_port="${MASTER_PORT}" \
    xxx/lib/python3.10/site-packages/swift/cli/sft.py \
    --model Qwen/Qwen2.5-VL-7B-Instruct \
    --dataset ./questions_ocr_promptnew_add_prompt_250408.jsonl \
    --learning_rate 6e-6 \
    --train_type full \
    --deepspeed zero3_offload \
    --attn_impl flash_attn \
    --freeze_vit \
    --output_dir ./output/ \
    --num_train_epochs 5 \
    --per_device_train_batch_size 1 \
    --save_steps 100 \
    --logging_steps 1 \
    --max_new_token 5000 \
    --dataloader_num_workers 4 \
    --gradient_accumulation_steps 8 \
    --max_pixels 1003520 \
    --custom_data_aug true \
    --dynamic_ocr true \
    --mode0_prob 0.9 \
    --num_img_to_ocr 1 \
    --remove_unused_columns False \
    --split_dataset_ratio 0.0 \
    