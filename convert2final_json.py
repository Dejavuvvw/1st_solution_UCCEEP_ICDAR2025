import os
from os import path as osp
import json

import argparse

# 创建解析器
parser = argparse.ArgumentParser(description="convert swift to pred json")

# 定义命令行参数
parser.add_argument('swift_output', type=str, help='the output of swift')
parser.add_argument('output_file_name', type=str, help='save json name')

# 解析命令行参数
args = parser.parse_args()

with open(args.swift_output, 'r', encoding='utf-8') as f:
    pred_data = []
    for line in f:
        data = json.loads(line)
        qa_id = data['qa_id']
        response = data['response']
        pred_data.append(
            {
                "qa_id": qa_id,
                "result": response
            }
        )

with open(args.output_file_name, 'w', encoding='utf-8') as f:
    f.write(json.dumps(pred_data, ensure_ascii=False, indent=4))