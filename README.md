<p align="center">
  <h2 align="center" style="margin-top: -30px;">Team PA-VCG’s Solution for Competition on
Understanding Chinese College Entrance Exam
Papers in ICDAR’25</h2>
</p>

<div style="font-family: charter;" align="center">
    <a href="https://github.com/Dejavuvvw" target="_blank">Wei Wu</a>,
    <a href="https://www.zhihu.com/people/wenjtop" target="_blank">Wenjie Wang</a>,
    <a href="tanyang1231@163.com" target="_blank">Yang Tan</a>,
    <a href="liuying234@163.com" target="_blank">Ying Liu</a>,
    <a href="diaoliang91@gmail.com" target="_blank">Liang Diao</a>
</div>

<br>
<p align="center">
  <img src="images/rank.jpg" alt="Method Overview" width="600">
</p>

[![arXiv](https://img.shields.io/badge/arXiv-2502.17422-b31b1b.svg)]()
[![ICDAR 2025](https://img.shields.io/badge/ICDAR-2025-green.svg)](https://note.kxsz.net/share/b0d4b929-232d-460d-9107-374a15d6767f)
[![Huggingface](https://img.shields.io/badge/Huggingface-orange.svg)](https://huggingface.co/Dejavuvvw/1st_solution_UCCEEP_ICDAR2025)

## 📰 News 
- [2025-06-09] We release our code and huggingface model and dataset.
- [2025-04-18] We win the competition.

## 📦 To be released
- arXiv paper for our solution.

## 📋 Overview

This repository contains the official implementation of our winning solution for the ICDAR 2025 competition on “Understanding Chinese College Entrance Exam Papers”.

## 🔥 Highlights

- 🔍 We use high resolution and multiple images MLLM for dense OCR predition.
- 📸 We use OCR distillation data and full-parameter finetune.
- 💪 We use some prompt refinement and post processing methods.

### Prepare OCR distillation data and prompt refinement
We use [OVIS-4B](https://huggingface.co/AIDC-AI/Ovis2-4B) to generate OCR data. For exam papers with double-columns, we first split them into single-column format before extracting OCR data.

## 🛠️ Installation

### Setup Environment
We use [ms-swift-3.2.0](https://github.com/modelscope/ms-swift/tree/v3.2.0) to train our models. You can setup environment follow [link](https://github.com/modelscope/ms-swift/tree/v3.2.0?tab=readme-ov-file#%EF%B8%8F-installation).

### Train with OCR
Use our [swift](./swift) to replace `ms-swift/swift`.

```bash
bash scripts/train.sh
```

And our data with ocr is in [link](https://huggingface.co/Dejavuvvw/1st_solution_UCCEEP_ICDAR2025/tree/main).

### Test
run inference.sh. One A800-80G is enough to run.

```bash
bash scripts/inference.sh
```

### Convert result
the output is saved in your model dir.

```python
python convert2final_json.py <your_pred_save_path> <save_json_name>
```

Our prediction results on TestB is [pred.json](./pred.json)


## 📚 Citation

If you find our paper and code useful for your research and applications, please cite using this BibTeX: