#!/bin/bash
# 通过markdown文件生成html文件，并建立web service访问html

HTML_DIR='html_tmp'

PORT=8000
if [ $# -ne 0 ]
then
    if [[ $1 =~ ^[0-9]+$ ]]
    then
        PORT=$1
        echo ${PORT}
    fi
fi

mkdir -p ${HTML_DIR}

find . -name "*.md" | while read md_file
do
    echo ${md_file}
    file_name=$(echo ${md_file} | sed "s/\.md$//")
    pandoc -f markdown -t html --html5 --atx-headers ${md_file} > ${HTML_DIR}/${file_name}.html
done

cd ${HTML_DIR}
echo "http://localhost:${PORT}"
python -m SimpleHTTPServer ${PORT}
