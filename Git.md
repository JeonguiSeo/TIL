# Git & GitHub
Git
> Source code 버전 관리를 위한 협업 툴
- [Git docs](https://git-scm.com/book/ko/v2)
- [누구나 쉽게 이해할 수 있는 Git 입문](https://backlog.com/git-tutorial/kr/intro/intro1_1.html)

## 분산형 버전 관리 시스템
- 파일의 변경사항을 추적하고 다자간 수정 내역을 관리하는 시스템

## DVCS(분산 버전 관리 시스템)
- 중앙집중식버전관리시스템
    - 로컬에서 파일을 편집하고 서버에 반영
    - 중앙 서버에서 버전 관리
- 분산 버전 관리 시스템
    - 로컬에서도 버전 기록 및 관리 가능
    - 원격 저장소를 활용하여 협업

## GitHub
> Git을 온라인에서 사용할 수 있도록 하는 서비스

### CLI
> Command Line Interface

- 기초 파일 시스템 명령어
    - `pwd` : 현재 directory 출력 (print working directory)
    - `cd` {directory_name} directory 이동 (change directory)
        - `.` : 현재 directory를 의미
        - `..` : 상위 directory를 의미
    - `ls` : 목록 (list)
    - `mkdir` : directory 생성 (make directory)
    - `touch {file_name}` : 파일 생성
    - `rm {file_name}` : 파일 삭제
        - `rm -r {folder_name}` : folder 삭제
### Git의 버전 관리 흐름
- modified : 파일이 수정된 상태 (from Working directory to Staging area /by add)
- staged : 수정한 파일이 곧 commit 예정임을 표시 (Staging area)
- committed : commit 완료된 상태

### Git의 구조
- Working directory : 파일의 변경사항
- Staging area : 버전을 기록하기 위한 파일 변경사항의 목록
    - Repository: Commit이 기록되는 공간
- Git code
    - `git init`: 새로운 git repository 생성
    - `git init` 이전에 main이 확인되는 경우, working directory 재할당
        
        ```bash
        rm -rf .git
        cd
        # (when (main) is disappeared, reboot the program)

        # OR cd에 직접 path 지정
        cd /c/path

        ```
        
    - `git add .` :  현재 directory의 모든 파일 및 폴더를 git의 추적 대상으로 추가
    (From Working directory To Staging area)
        - `git add {file_name1 file_name2 file_name3}`: directory 내 파일의 변경사항을 추가
    - `git status` : 파일 저장 및 staged 여부 확인
        - Git status message
            - `Untracked` : Commit이 발생한 적 없는 파일 (Git이 해당 파일을 추적/관리하고 있지 않음, only in working directory)
            - `Changes not staged for commit` : 변경 내역이 발생하였지만 staged되지 않음 (git add 필요, not in staging area)
            - `nothing to commit, working tree claen` : Git directory와 working directory의 버전이 일치하는 상태 (최신 업데이트)
    - `git commit -m {message}` : 버전 기록 후 메시지 출력 (Commit 메시지 지정)
        - `commit` : 변경된 파일의 버전을 기록 (To Repository)
        - 메시지는 작업  내용이 잘 드러나도록 작성
        - `git config --global core.editor "code --wait”` : 상세 메시지 작성을 위한 작업창 생성
    - `git log` : commit 히스토리 조회
        - `git log -1 —oneline` : 마지막 commit을 한 줄로 출력
        - `git log —oneline --graph` : Commit log를 그래프 형태로 출력
    - `git remote add origin {github URL}` : Git remote repository에 origin이라는 이름으로 url 추가
        - 기존 remote repository의 이름이 변경된 경우 재실행 필수
    - `git push origin main` : Git remote repository의 origin/main으로 전송
        - `push` : 로컬 저장소의 버전을 원격 저장소로 전송
            - 로컬에서의 작업이 모두 완료된 후, 원격 저장소로 전송
        - `pull` : 원격 저장소에서 버전 정보를 다운로드 (Fetch & Merge)
            - 로컬과 원격 저장소간 파일 오류 등 발생 시 실행
    - `git remote rm origin` : Git remote repository 삭제
    - `git remote -v` : Git remote repository 목록 조회

#### `.gitignore`
> Git repository or Staging area에 추가하지 않을 파일 지정
- 일반적 개발 프로젝트에서는 별도 버전 관리가 불필요한 file/directory 발생
    - 비공개 파일 (보안 관련 정보)
    - 개발 환경 관련 파일 : OS, Python, IDE, etc.
    - 용량이 너무 큰 파일
- Manual
    - [https://www.toptal.com/developers/gitignore](https://www.toptal.com/developers/gitignore/) : 주로 사용되는 `.gitignore` 파일 생성 사이트
    - 최상위 directory에 저장하며, 파일명은 반드시 `.gitignore`로 지정
        
        ```bash
        touch .gitignore
        ```
        
    - 이미 commit된 파일은 반드시 삭제하여야 .gitignore 적용 가능
        
        ```bash
        # 특정 파일 제외 (file_name.extension)
        file_name.txt # 동일한 파일명 모두 제외
            
        # 현재 경로의 특정 파일 제외
        /file_name.txt
            
        # 특정 경로의 특정 파일 제외
        folder_name/file_name.txt
            
        # 특정 폴더의 파일 모두 제외
        folder_name/
            
        # 특정 확장자 파일 모두 제외
        *.txt
            
        # 예외 처리
        !file_name.txt
        ```
            
### Branch
- Git flow ([우아한 기술블로그](https://techblog.woowahan.com/2553/))
    - main(master) : 제품으로 출시될 수 있는 branch
    - hotfix : 출시 버전에서 발생한 버그를 수정하는 branch
    - release : 이번 출시 버전을 준비하는 branch
    - develop : 다음 출시 버전을 개발하는 branch
    - feature : 기능을 개발하는 branch
- Branch manual
    - `git branch {branch_name}` : branch 생성
    - `git checkout {branch_name}` : branch로 이동
    - `git checkout -b {branch_name}` : branch 생성 및 이동
    - `git branch` : branch 목록 확인
    - `git branch -d {branch_name}` : branch 삭
    - `git merge {main branch}` : 각 branch에서 작업된 이력을 main branch에 병합
        - 병합 진행 시, 서로 다른 commit에서 충돌 발생 가능성 존재
            - 동일한 파일을 수정한 경우
                - 반드시 직접 해당 파일을 확인하고 적절히 수정
                - 수정 이후 직접 commit 진행
            - 다른 파일을 수정한 경우
                - 충돌 없이 merge commit 생성

### Fork
- `git clone <git URL>` : Git repository 복사 (파일 및 commit log)
- Repository간 fork를 통해 파일 수정 및 commit 가능
- Forked copy에서 pull request 시, repository 소유자에게 commit 요청 가능

#### Clone
> Copying remote repository
* 협업 프로젝트 진행 및 외부 오픈소스 참여 시 사용
    * GitHub의 파일을 타 pc 및 directory에서 작업 시 활용 가능

* Clone manual 
    - `git clone {Remote repository URL}` : Remote repository 복제
    - `git remote -v` : Remote repository 정보 확인
    - `git remote add {Remote repository} {URL}` : Remote repository 추가 (일반적으로 origin)
    - `git remote rm {Remote repository}` : Remote repository 삭제
    - `git push {Remote repository} {branch}` : Remote repository에 push
    - `git pull {Remote repository} {branch}` : Remote repository로부터 pull

    ``` bash
        
    ```
