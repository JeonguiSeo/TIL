# Markdown
### Text quote
> plain text format의 markup language


## Heading
* Heading은 `h1` ~ `h6` tag로 표현

------------------------------
# A first-level heading
## A second-level heading
### A third-level heading
------------------------------

## List
List는 `ul` or `ol` tag로 표현
### Ordered List
1. a
2. b
3. c
### Unordered List
- First
- Second
- Third


## Fenced Code Block
```
언어를 지정하지 않고 표현
```

### python language 지정
``` python
# 주석
print('hello')
```

### HTML language 지정
```html
<!-- 주석-->
# 파이썬 주석
<h1>Markdown<h1/>
```


## Link
### Web link 삽입
- [Google](https://google.com)
### Local file link 삽입
- [Python](./python.md)
#### Indentation
    - `.`: 현재 directory(folder)
    - `..`: 상위 directory
    - local file 연결 가능


## Image 삽입
![image](./Mojave%20Night.jpg)


## Table
|이름|나이|
|--|--|
|홍길동|100|
|김철수|50|


# Text style
*기울임* **굵게** ~~취소선~~
___
text

|스타일|Syntax|바로 가기 키|예제|출력|
|------|------|------|------|------|
|굵게|`** **` or `Ctrl+B`|`**This is bold text**`|**굵게 표시된 텍스트**|
|기울임꼴|`* *` or `_ _`|`Ctrl+I`|`*This text is italicized*`|*기울임꼴로 표시된 텍스트*|
|취소선|`~~ ~~`|없음|`~~This was mistaken text~~`|~~실수하여 취소된 텍스트~~|
|굵게 및 중첩된 기울임꼴|`** **` and `_ _`|없음|`**This text is _extremely_ important**`|**매우 _중요한_ 텍스트**|
|모든 굵게 및 기울임꼴|`*** ***`|없음|`***All this text is important***`|***이 모든 텍스트가 중요합니다.***|
|아래 첨자|`<sub> </sub>`|없음|`<sub>This is a subscript text</sub>`|<sub>아래 첨자 텍스트입니다.</sub>
|위 첨자|`<sup> </sup>`|없음|`<sup>This is a superscript text</sup>`|<sup>위 첨자 텍스트입니다.</sup>|

---

# Git 사용법

## 기초 파일 시스템 명령어
- `pwd` (print working directory): 현재 directory 출력
- `cd` directory_name (change directory): directory 이동
    - `.`; 현재 directory
    - `..`: 상위 directory
- `ls` (list): 목록
- `mkdir` (make directory): directory 생성
- `touch`: 파일 생성
- `rm` file_name: 파일 삭제
    - `rm -r` folder_name: folder 삭제

## Git structure
- Working directory: 파일의 변경사항
- Staging area: 버전을 기록하기 위한 파일 변경사항의 목록
- Repository: Commit들이 기록되는 공간

## Git codes
- `git init`: 새로운 git repository 생성
- `touch` file_name: 파일 생성
- `git add .`:  현재 directory의 모든 파일 및 폴더를 git의 추적 대상으로 추가
    - (From Working directory To Staging area)
    - `git add`: 디렉토리 내 파일의 변경사항을 추가
- `git commit -m` message: 버전 기록 후 메시지 출력 (Commit 메시지 지정)
    - `commit`: 변경된 파일의 버전을 기록 (To Repository)
- `git status`:
    - 현 directory의 파일 상태 확인
        - Untracked files
        - Changes not staged for commit
        - Changes to be committed
    - Nothing to commit, working tree clean
- `git log`: commit 히스토리 조회
    - `git log -1 —one line`: 마지막 commit을 한 줄로 출력