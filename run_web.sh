#!/bin/bash
# 通过markdown文件生成html文件，并建立web service访问html

HTML_DIR='html_tmp'

mkdir -p ${HTML_DIR}

find . -name "*.md" | while read md_file
do
    echo ${md_file}
    file_name=$(echo ${md_file} | sed "s/\.md$//")
    pandoc -f markdown -t html ${md_file} > ${HTML_DIR}/${file_name}.html
done

cd ${HTML_DIR}
python -m SimpleHTTPServer 8000
