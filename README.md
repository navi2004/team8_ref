# Bash 파일 검색 도구

공개SW실무 발표 실습용 Bash 파일 검색 도구입니다. 입력한 디렉터리에서 확장자 또는 최근 수정 시각을 기준으로 파일 목록을 찾습니다.

## 기능

- 확장자를 입력해 해당 파일을 검색합니다.
- 최근 약 72시간 이내에 수정된 일반 파일을 검색합니다.
- 잘못된 경로나 검색 결과가 없는 경우 안내 문구를 출력합니다.
- 파일 이름과 수정 시각으로 목록을 찾으며, 파일 내용이나 보안 상태는 분석하지 않습니다.

## Ubuntu에서 실행하기

`file_search.sh`를 `~/shell-demo` 디렉터리에 저장한 다음 실행 권한을 설정합니다.

```bash
mkdir -p ~/shell-demo
chmod +x ~/shell-demo/file_search.sh
cd ~
./shell-demo/file_search.sh
```

프로그램이 검색할 디렉터리를 물으면 `shell-demo`를 입력하세요. 이 프로그램은 입력한 경로 문자열의 `~`를 자동으로 확장하지 않으므로, 홈 디렉터리에서 실행할 때는 `~/shell-demo` 대신 `shell-demo`를 입력합니다.

## 샘플 파일 준비

```bash
mkdir -p ~/shell-demo
touch ~/shell-demo/report.txt ~/shell-demo/note.txt
touch ~/shell-demo/run.sh ~/shell-demo/"team note.txt"
touch -d '5 days ago' ~/shell-demo/old.txt
```

날짜 검색 결과에는 최근 수정된 파일과 `file_search.sh`가 포함되고, 5일 전에 수정한 `old.txt`는 제외됩니다. 확장자 검색은 수정 시각과 관계없이 `.txt` 파일을 찾으므로 `old.txt`도 결과에 포함됩니다.

## 라이브 실습

1. 메뉴에서 `1`을 선택하고 `txt`를 입력해 확장자를 검색합니다.
2. `pdf`를 입력해 결과 없음 안내를 확인합니다.
3. 메뉴에서 `2`를 선택해 최근 수정 파일을 검색합니다.
4. 존재하지 않는 경로를 입력해 경로 오류 안내를 확인합니다.
