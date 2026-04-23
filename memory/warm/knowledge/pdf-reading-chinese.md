---
name: pdf-reading-chinese
description: 解决中文PDF读取问题的方法
type: reference
---

# 中文 PDF 读取方法

## 问题
pdftotext 默认无法解析中文 PDF（Adobe-GB1 编码），出现乱码：
```
Syntax Error: Unknown character collection 'Adobe-GB1'
```

## 解决方案：pdfminer.six

### 1. 安装
```bash
pip install pdfminer.six
```

### 2. 使用 Python 提取文本
```python
from pdfminer.high_level import extract_text

text = extract_text('文件路径.pdf')
with open('output.txt', 'w', encoding='utf-8') as f:
    f.write(text)
```

### 3. 命令行方式
```bash
python -c "from pdfminer.high_level import extract_text; print(extract_text('文件.pdf'))"
```

## 其他备选方案

### PyMuPDF（更好的中文支持）
```bash
pip install pymupdf
python -c "import fitz; doc=fitz.open('文件.pdf'); print(doc[0].get_text())"
```

### pdftotext 指定编码
```bash
pdftotext -enc GBK "文件.pdf" output.txt
```

## 实际应用
- 野火霸天虎 F407 开发板 PDF：`D:/Claude/memory/knowledge/开发板说明.pdf`
- 提取后保存到：`pdf_content.txt`
