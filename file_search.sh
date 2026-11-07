#!/bin/bash

read -r -p "검색할 디렉터리 경로를 입력하세요: " target_dir

if [[ ! -d "$target_dir" ]]; then
    echo "디렉터리를 찾을 수 없습니다: $target_dir"
    exit 1
fi

echo "1. 확장자로 검색"
echo "2. 최근 3일 이내 수정된 파일 검색"
read -r -p "검색 방법을 선택하세요: " choice

if [[ "$choice" == "1" ]]; then
    read -r -p "찾을 확장자를 입력하세요 (예: txt): " ext

    if [[ -z "$ext" ]]; then
        echo "확장자를 입력해 주세요."
        exit 1
    fi

    count=0

    for file in "$target_dir"/*."$ext"; do
        if [[ -f "$file" ]]; then
            printf "발견: %s\n" "${file##*/}"
            count=$((count + 1))
        fi
    done

    if [[ "$count" -eq 0 ]]; then
        echo "조건에 맞는 파일이 없습니다."
    fi

elif [[ "$choice" == "2" ]]; then
    recent_files=$(find "$target_dir" -type f -mtime -3 -print)

    if [[ -n "$recent_files" ]]; then
        printf "%s\n" "$recent_files"
    else
        echo "최근 3일 이내에 수정된 파일이 없습니다."
    fi

else
    echo "1 또는 2를 선택해 주세요."
fi
