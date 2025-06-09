import os
from os import path as osp
import numpy as np
from swift.utils import get_logger

logger = get_logger()

class Compose(object):
    def __init__(self, transforms):
        self.transforms = transforms
    
    def __call__(self, args):
        for t in self.transforms:
            args = t(args)
        return args


class RandomOCROrVQA(object):
    def __init__(self, mode0_prob=0.7, num_img_to_ocr=1, is_train=True):
        self.is_train = is_train
        self.mode0_prob = mode0_prob
        self.num_img_to_ocr = num_img_to_ocr

    def __call__(self, args):
        if self.is_train:
            mode = np.random.choice(range(2), p=[self.mode0_prob, 1-self.mode0_prob])
            if mode == 1:  # 选择ocr
                ocr = eval(args['ocr'])
                imgs = [osp.basename(item['path']) for item in args['images']]
                min_size = min(len(imgs), self.num_img_to_ocr)
                random_idx = np.random.choice(range(len(imgs)), size=min_size, replace=False)
                select_imgs = []
                select_img_data = []
                for idx in random_idx:
                    select_imgs.append(imgs[idx])
                    select_img_data.append(args['images'][idx])
                messages = args['messages']
                messages[0]['content'] = "Please output the OCR results of these images, and revert their layout."
                ocr_response = ''
                for img_name in select_imgs:
                    ocr_response += ocr[img_name] + '\n\n' 
                messages[1]['content'] = ocr_response
                args['images'] = select_img_data
                args['messages'] = messages
        return args
        # if self.is_train:
