#!/bin/bash

# 정렬할 파일들이 들어있는 폴더의 상대 경로
SOURCE_FOLDER="files"

# 'files' 폴더가 현재 위치에 있는지 확인
if [ ! -d "$SOURCE_FOLDER" ]; then
    echo "Error: Directory '$SOURCE_FOLDER' not found."
    echo "Please run this script in the '~/SWE_2021_41_2025_2_week_5-main/' directory."
    exit 1
fi

# 'files' 폴더 안의 모든 항목에 대해 반복 작업을 수행
for filepath in "$SOURCE_FOLDER"/*
do
    # 해당 경로가 일반 파일일 경우에만 로직을 실행 (디렉터리 등은 제외)
    if [ -f "$filepath" ]; then
        # 경로에서 파일 이름만 분리 (예: "files/Kiwi.txt" -> "Kiwi.txt")
        filename=$(basename "$filepath")
        
        # 파일 이름의 첫 글자를 가져옴
        first_char="${filename:0:1}"
        
        # 첫 글자를 소문자로 변환하여 목적지 폴더의 이름으로 지정
        # (예: 'K' -> 'k', 'a' -> 'a')
        dest_folder_name="${first_char,,}"
        
        # 목적지 폴더가 없다면 생성 (-p 옵션으로 오류 방지)
        mkdir -p "$dest_folder_name"
        
        # 원본 파일을 목적지 폴더로 이동
        mv "$filepath" "$dest_folder_name/"
    fi
done