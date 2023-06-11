# Python - Data Analytics

## **Introduction**
- 파일 형식
    - *.py
        - Text 기반
        - 메모장으로 확인 가능
    - *ipynb
        - Binary 기반
        - 메모장으로는 확인 불가
        - Web 환경 - Colab, Kaggle
- 주의사항
    - Dent 및 space, enter 사용에 유의
    - Upper/lower case 구분
        - True, False는 반드시 첫 문자를 upper case로 작성
    - Double/single quote는 구분하지 않음
    - Pycharm 실행 중 오류 발생 시, Process finished with exit code ≠ 0 출력
        - 오류는 console 최상단에서 확인
- Tip
    - `Ctrl + D` : 해당 코드를 하단에 복사
    - `Ctrl + Z` : 실행 취소
    - `Ctrl + Shit + 방향키` : 코드 이동
- Data type
    - 일반 자료형 (Scalar type, immutable)
        - Integer
        - Float
        - Boolean
        - Function
        - None
        
        ```python
        print("1.정수: ", 0)
        print("1.정수(음수): ", -10)
        print("1.정수(10진수): ", 10)
        
        print("1.정수(2진수): ", 0b10)   # 2
        print("1.정수(8진수): ", 0o10)  # 8
        print("1.정수(16진수): ", 0x10) # 16
        
        print("2.실수: ", 3.14)
        print("2.실수(지수표기법): ", 3e+5) #300000.0
        print("3.논리: ", True)
        print("3.논리: ", False)
        print("4.None: ", None) # Null
        ```
        
    - 집합 자료형 (Iterable)
        - Str : immnutable -  `‘ ’` or `“ ”`
        - List : index, duplicable, mutable - `[ ]`
        - Tuple : index, duplicable, immutable - `( )`
        - Set : non-index, not duplicale, immutable value만 저장 가능 - `{ }`
        - Dict : `{Key : Value}`
        
        ```python
        rint("1. 문자열: ", "hello")
        print("1. 문자열: ", 'hello')
        print("1. 문자열: ", """hello""") # triple 가능
        print("1. 문자열: ", '''hello''') # triple 가능
        
        print("2. 리스트(list): ", [1, 2, 3, 4, 4, "hello"]) # index, duplicable, mutable
        print("3. 튜플(tuple): ", (1, 2, 3, 4, 4, "hello")) # index, duplicable, immutable
        
        print("4. 셋(set): ", {1, 2, 3, 4, 4, "hello"}) # non-index, not duplicable, immutable value only
        print("5. 딕트(dict): ", {"name": "홍길동", "age": 20}) # {Key : Value}
        ```
        
    - Escape character
        
        ```python
        # 이스케이프 문자 (escape 문자)
        print("c:\\temp") # 주로 file 경로 지정 시 사용
        
        print("Hello\nworld") # new line 추가
        print("Hello\tworld") # tab 추가
        
        print("she\'s") # single quote
        print("\"hello\"") # double quote
        print("\'")
        print("\"")
        ```
        
    - Raw string
        
        ```python
        # raw string (r) (escape 문자 무시 처리)
        # 정규표현식에서 주로 사용 (regular expression - pattern matching, etc.)
        # 정규표현식에서의 특수 기능 문자 :  *?+^() etc.
        print(r"c:\\temp") # c:\\temp
        print(r"c:\temp") # c:\temp
        
        print(r"Hello\nworld") # Hello\nworld
        print(r"Hello\tworld") # Hello\tworld
        
        print(r"she\'s") # she\'s
        print(r"\"hello\"") # \"hello\"
        ```
        
    - Reserved word(예약어)
        
        ```python
        import keyword
        print(keyword.kwlist)
        '''
        ['False', 'None', 'True', 'and', 'as', 'assert',
        'async', 'await', 'break', 'class', 'continue',
        'def', 'del', 'elif', 'else', 'except', 'finally',
        'for', 'from', 'global', 'if', 'import', 'in', 'is',
        'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise',
        'return', 'try', 'while', 'with', 'yield']
        '''
        ```
        
- Variable
    - Data 저장 용도
        - 일반형
        - 집합형
    - Variable = value
        - 변수 자체에 값을 지정하는 것이 아닌, 값이 저장된 주소를 지정 (Reference를 가짐)
        - 즉, python에서는 모든 variable이 reference variable에 해당당
        - Python에만 해당하는 특징
    - Simultaneous assignment (동시 할당)
        - `Variable_name = value`
        - `Variable_name1 = Variable_name2 = Variable_name3 = value`
        - `Variable_name1, Variable_name2, Variable_name3 = value1, value2, value3`
        
        ```python
        n = n1 = n2 = 10
        
        # 값을 여러 변수에 저장
        '''
        n = 10
        n1 = 10
        n2 = 10
        '''
        print(n, n1, n2)
        
        # 반드시 variable과 value의 개수 일치
        name, age, address = "홍길동", 20, "서울"  # tuple이나 list 형태로 입력한 경우에도 각각 할당
        print(name, age, address)
        
        # dummy variable ==> _(underscore) 이용
        a, b, _ = 10, 20, 30
        print(a, b)  # 10 20
        
        a, b = {'x': '홍길동', 'y': '이순신'}
        print(a, b)  # x y => key값 할당
        ```
        
    - Dummy variable → `_` (underscore)
        - 여러 변수 지정 시, 개수 matching
    
        
- 표준 출력 - print
    
    ```python
    print(1, 2, 3, 4, sep=',')  ## sep=',': ','를 print 구분자로 지정
    # 1,2,3,4
    
    print(1, 2, 3, 4, sep=',', end="\t")  ## 출력을 완료한 뒤, 다음 출력은 tab을 두고 이어서 출력
    print(1, 2, 3, 4, end=" ")  ## 출력을 완료한 뒤, 다음 출력은 공백을 두고 이어서 출력 (default = '\n')
    print(1, 2, 3, 4, sep=',')
    # 1,2,3,4	1 2 3 4 1,2,3,4
    ```
    
- 표준 입력 - input
    - input을 통해 입력하는 모든 명령은 str으로 인식
    
    ```python
    
    name = input('이름 입력')  # 홍길동
    age = input('나이 입력')  # 31  # str으로 인식
    grade = int(input('학년 입력'))
    
    print(name, age)
    
    print(name, int(age) + 1, grade + 1)  # int로 변경
    ```
    
- Format
    
    ```python
    # 1. 문자열 데이터 표현
    mesg = "이름:{}".format('홍길동')
    print(mesg)
    mesg = '이름:{0}'.format('홍길동')  # index로 0번째 변수임을 지정
    print(mesg)
    mesg = '이름:{0}, 나이:{1}'.format('홍길동',20)  # 0번째 변수, 1번째 변수  # 순서대로 입력하는 경우, index 생략 가능
    print(mesg)
    
    mesg = '이름:{0:5s}, 나이:{1}'.format('홍길동',20)  # 0:5s - 0번째 변수를 5자리 str으로 표현
    print(mesg)
    
    # 2. 수치 데이터 표현
    mesg = '{0}'.format(123456789) # int
    print(mesg)
    
    mesg = '{0:f}'.format(123456789) #123456789.000000  # float은 소수점 6째자리까지 default
    print(mesg)
    
    mesg = '{0:.3f},{0:.9f}'.format(123.4567)  # 0:.nf - 소수점 n번째 자리까지 표현
    print(mesg)
    
    mesg = '{0:,}'.format(123456789)  # 0:, - 자릿수를 ','로 구분하여 출력
    print(mesg)
    
    # 3. key 사용 - important!
    mesg = '이름: {username}, 나이: {age}'.format(username='홍길동', age=20)
    print(mesg)
    
    # 4. unpacking - str/list (집합형 data를 분할하여 출력 w/'*')
    # str
    mesg = '{0}:{1}:{2}'.format(*'홍길동')
    print(mesg)  # 홍:길:동
    #list
    mesg = '{0}:{1}:{2}'.format(*['홍길동', '이순신', '강감찬'])
    print(mesg) # 홍길동:이순신:강감찬
    
    # 4. unpacking - dict (dict에서의 unpacking은 '**' 사용)
    person = {'username': '홍길동', 'age': 20}
    mesg = '이름: {username}, 나이: {age}'.format(**person)  # key 사용 형태로 unpacking
    print(mesg)     # 이름: 홍길동, 나이: 20
    
    # sorting, filling, etc.
    help('FORMATTING')  # sample 예제 출력
    ```
    
    - `“  “.format()`
        - 지정 방식 - `“  “ % (value1, value2, value3…)`
            - `d%` - int
            - `s%` - str
            - `c%` - str (하나의 문자)
            - `f%` - float
            
            ```python
            print("이름: %s 나이: %d 신장: %.2f 결혼여부:%s 성별:%c"
                    % ("홍길동", 200, 178.5987, True, '남'))
            
            # 이름: 홍길동 나이: 200 신장: 178.60 결혼여부:True 성별:남
            ```
        
    - format string
        - value가 variable에 저장된 경우 사용
            
            ```python
            name = '홍길동'
            f'이름 : {name}'
            
            # 이름:홍길동
            ```
            
        - format string 내부에서의 산술/비교연산 및 함수 적용 가능
            
            ```python
            name = "KyIN"
            age = 20
            
            print("이름:{name} 나이:{age}")
            print(f"이름:{name} 나이:{age}")
            print(f"이름:{name} 나이:{age + 1}")  # { } 내부에서의 산술 연산 가능
            print(f"이름:{name} 나이:{age > 30}")  # { } 내부에서의 비교 연산 가능 (Ture / False)
            print(f"이름:{name.lower()} 나이:{age > 30}")  # 함수 적용 가능
            ```
            
- 연산자
    - 산술 연산자
        
        ```python
        print("h" * 10) # hhhhhhhhhh
        print(a/b)    # 3.3333333333333335  # 나누기의 소수점까지 출력
        print(a % b)  # 1  ,  Modulus
        
        print(a//b)   # 3  ,  Floor Division   소수점 버림
        print(a**b)   # square ( 제곱 )
        
        # 목과 나머지를 한번에 반환 - tuple 형태로 반환
        result = divmod(10, 3)
        print(result)  # (3, 1)
        print(type(result))  # <class 'tuple'>
        
        x, y = divmod(10, 3)  # 몫과 나머지를 각각 x, y에 할당 - 일반적인 사용법
        print(x, y)  # 3 1
        print(type(x), type(y))  # <class 'int'> <class 'int'>
        ```
        
    - 대입 연산자
        
        ```python
        n = 10
        n2 = 4
        
        n += n2  # n = n + n2
        print(n, n2)  # 14 4
        
        n -= n2  # n = n - n2
        print(n, n2)  # 10 4
        
        n *= n2  # n = n * n2
        print(n, n2)  # 40 4
        
        n /= n2  # n = n / n2
        print(n, n2)  # 10.0 4
        
        n //= n2  # n = n // n2
        print(n, n2)  # 2.0 4
        
        n **= n2  # n = n ** n2
        print(n, n2)  # 16.0  4
        ```
        
        - Packing
            - 대입 개수가 다른 경우 사용
            - 모든 집합형 데이터 사용 가능
            - Dict packing 시에는 key value 할당
            
            ```python
            # 대입 개수가 다른 경우 packing 사용
            x = [10, 20, 30]  # 하나의 list 안에 3개의 값 할당
            print(x)
            
            x, y, z = [10, 20, 30]  # 개수 및 위치 일치 필수
            print(x, y, z)
            
            v1, *v2 = [10, 20, 30]  # '*'를 할당한 변수에 나머지 값 모두 할당 - packing
            print(v1,v2)  # 10 [20, 30]
            
            # tuple or set, dict 모두 동일 적용 가능
            
            v1, *v2 = (10, 20, 30, 40, 50)
            print(v1,v2)  # 10 [20, 30, 40, 50]
            
            v1, *v2 = {10, 20, 30, 40, 50}
            print(v1,v2)  # 10 [20, 30, 40, 50]
            
            # 단, dict에는 key value 할당
            v1, *v2 = {'a': 100, 'b': 200, 'c': 300}
            print(v1,v2)  # a ['b', 'c']
            
            *x, y, z = (10, 20, 30, 40, 50, 60)
            print(x, y, z) # [10, 20, 30, 40], 50, 60
            ```
            
    - 비교 연산자
        
        ```python
        k = 10
        k2 = 5
        
        print( k == k2 )  # False
        print( k != k2 )  # True
        print( k > k2 )  # True
        print( k >= k2 )  # True
        print( k < k2 )  # False
        print( k <= k2 )  # False
        
        # None 비교
        xyz = None
        print( xyz is None ) # recommended  # True
        # == 연산자 사용 시, 값만을 비교
        # is 연산자 사용 시, 할당된 주소를 통해 비교
        
        # n값이 5보다 크고 20보다 작은지 비교
        n = 10
        result = (n > 5) and (n < 20)
        print(result)  # True
        
        result = 5 < n < 20  # python에서만 가능 (Not recommended)
        print(result)  # True
        ```
        
        - 동등 비교 시, 주의사항
            
            ```python
            '''
            a == b : a와 b의 실제값을 비교
            a is b : a와 b의 주소값을 비교
                    id(a) == id(b)
            '''
            
            a = [1, 2, 3, 4, 5]
            b = a
            
            print(a, id(a))  # [1, 2, 3, 4, 5] 2479026564672
            print(b, id(b))  # [1, 2, 3, 4, 5] 2479026564672
            
            print(a == b)  # Ture
            print(a is b, id(a) == id(b))  # True True
            
            c = a[:]  # a의 복사본 할당
            print(c, id(c))  # [1, 2, 3, 4, 5] 2107072064640
            # 복사본 생성 시, 다른 주소값을 할당
            
            print(a == c)  # True
            print(a is c)  # False
            ```
            
        - Copy
            - Deep copy와 shallow copy를 구분하여 사용
                - Deep copy : 실제 값 복사
                - Shallow copy : 주소값 복사
            
            ```python
            # deep copy - 실제 값 복사
            [:]  # slicing
            copy()
            list()
            
            # 원본 변경 시, copy는 미변경
            n = [1, 2, 3]
            m = n[:]  # m = n.copy()
            print(n, id(n))  # [1, 2, 3] 1822978415680
            print(m, id(m))  # [1, 2, 3] 1822978415872
            n[0] = 100
            print(n, m)  # [100, 2, 3] [1, 2, 3]
            
            # Shallow copy - 주소값 복사
            n = m  # m = n.copy()
            # 주소값으로 적용하는 경우, m의 값이 변경되면 n 또한 변경
            n = [1, 2,3]
            m = n
            print(n, id(n))  # [1, 2, 3] 1738572276992
            print(m, id(m))  # [1, 2, 3] 1738572276992
            n[0] = 100
            print(n, m)  # [100, 2, 3] [100, 2, 3]
            
            ```
            
    - 논리 연산자
        
        ```python
        print(True and True)   # True
        print(True and False)  # False
        print(False and True)  # False
        print(False and False) # False
        print()
        print(True or True)    # True
        print(True or False)   # True
        print(False or True)   # True
        print(False or False)  # False
        print()
        print(not True)        # False
        print(not False)       # True
        
        n = 10
        result = (n > 5) and (n < 20)  # recommended - 일반적인 프로그램 언어 사용 방식
        print(result)
        
        # True/False 형식이 아님에도 False로 처리하는 값 - if[] == if False
        0
        " "
        None
        []
        {}
        set()
        ```
        
    - True / False 처리 데이터
        
        ```python
        # False로 처리되는 데이터
        
        print(not 0)  # True
        print(not "")  # True
        print(not None)  # True
        print(not[])  # True
        print(not{})  # True
        print(not set())   # True
        
        # True로 처리되는 데이터
        print(not 10)  # False
        print(not "AA")  # False
        print(not [1, 2])  # False
        print(not {'age': 20})  # False
        ```
        
    - Membership 연산자 (in 연산자)
        
        ```python
        # 지정된 값의 집합협 데이터 내 존재 여부 확인
        
        n = [10,9,8]
        result = 10 in n
        print("10포함 여부: ", result)
        
        n = (10,9,8)
        result = 10 in n
        print("10포함 여부: ", result)
        
        n = {10,9,8}
        result = 10 in n
        print("10포함 여부: ", result)
        
        # dict는 값이 아닌 key 존재 여부를 확인
        n = {"name":"홍길동","age":20}
        result = "name" in n
        print("name 키포함 여부: ", result)
        ```
        
- 데이터 타입 변환
    
    ```python
    '''
        일반형 데이터의 형변환
        int(value): int로 변경
        float(value): float으로 변경
        bool(value): boolean으로 변경
    
        집합형 데이터의 형변환
        str(value): str로 변경
        list(value): list로 변경
        tuple(value): tuple로 변경
        set(value): set으로 변경
        dict(value): dict로 변경
    '''
    
    # 1. int로 변환
    print(int(3.5))    # 3
    print(int(-3.5))   # -3
    print(int(True))   # 1
    print(int(False))  # 0
    print(int("123"))  # 123
    
    # 2. float으로 변환
    print(float(3))                     # 3.0
    print(float(-3))                    # -3.0
    print(float(True))                  # 1.0
    print(float(False))                 # 0.0
    print(float("123.34"))              # 123.34
    print(float("123"))                 # 123.0
    
    # 3. boolean으로 변환
    print(bool(0))     # False
    print(bool(""))    # False
    print(bool(None))  # False
    print(bool([]))    # False
    print(bool({}))    # False
    print(bool())      # False
    print()
    print(bool(10))          # True
    print(bool("123"))       # True
    print(bool([10,20,30]))  # True
    print(bool({"age":20}))  # True
    print(bool(10,))         # True  # Tuple
    
    # 4. str으로 변환
    print(str(123))   # "123" <class 'str'>
    print(str(3.14))  # "3.14"
    print(str(True))  # "True"
    ```
        
## **집합형 데이터**
- String data
    - Str 생성 방법
        
        ```python
        # 직접 지정
        n = "hello"
        n = 'hello'
        n = """hello"""
        n = '''hello'''
        
        # 형변환
        n = str(10)
        
        # triple quote : 정형화된 문자열 처리 (e.g., html)
        # single/double quote는 \n 없이 행 전환 불가
        s2 = """
            <html>
                <body>
                    <p>
        """
        print(s2)  
        #     <html>
        #         <body>
        #             <p>
        
        s3 = "<html>" \
                "<body" \
                "<p>"
        print(s3)  # <html><body<p>
        ```
        
    - String function
        
        ```python
        print(dir(str))  # str 문자열에 내장된 함수
        '''
        ['capitalize', 'casefold', 'center', 'count', 'encode', 'endswith',
        'expandtabs', 'find', 'format', 'format_map', 'index', 'isalnum',
        'isalpha', 'isascii', 'isdecimal', 'isdigit', 'isidentifier', 'islower',
        'isnumeric', 'isprintable', 'isspace', 'istitle', 'isupper', 'join',
        'ljust', 'lower', 'lstrip', 'maketrans', 'partition', 'removeprefix',
        'removesuffix', 'replace', 'rfind', 'rindex', 'rjust', 'rpartition',
        'rsplit', 'rstrip', 'split', 'splitlines', 'startswith', 'strip',
        'swapcase', 'title', 'translate', 'upper', 'zfill']
        '''
        ```
        
        ```python
        # 문자열은 str object로 관리
        s = "sequence"
        print(type(s))  # <class 'str'>
        
        print("1. 문자열 길이:", len(s)) # 8
        # len : built-in 함수이므로 len(문자열) 형태로 사용)
        
        print("2. 특정문자 포함횟수:", s.count('e')) # 3
        
        print("3. 소문자로:", "HeLLo".lower()) # hello
        
        print("4. 대문자로:", "HeLLo".upper()) # HELLO
        
        print("5. swap 문자로:", "HeLLo".swapcase()) # hEllO  # 대소문자 반전
        
        print("6. 공백 및 특정 문자 제거:\n")  # SQL의 ltrim, rtrim, trim 기능과 유사
        print("    HeLLo    ".lstrip()) # 'HeLLo    '
        print(len("    HeLLo    ".lstrip())) # 9
        
        print("HHeLLH".lstrip("H")) # eLLH  # 좌측 'H' 제거
        print("    HeLLo    ".rstrip()) # '    HeLLo'
        print(len("    HeLLo    ".rstrip())) # 9
        print("HHeLLHH".rstrip("H")) # HHeLL  # 우측 'H' 제거
        
        print("    HeLLo    ".strip()) # 'HeLLo'
        print(len("    HeLLo    ".strip())) # 5
        print("HHeLLHH".strip("H")) # eLL
        
        print("7. 문자열 변경:", "HeLHO".replace('H', 'A')) # AeLAO
        print("8. 구분자:", "aaa/bbb/ccc".split("/")) # ['aaa', 'bbb', 'ccc']
        print("8. 구분자:", "aaa,bbb,ccc".split(",")) # ['aaa', 'bbb', 'ccc']
        
        print('9. 특정 글자 시작 : ', s.startswith('s'), s.startswith('a')) # True False
        print('10. 특정 글자 끝 : ', s.endswith('e'), s.endswith('x')) # True False
        
        print("11. 문자로만 구성?", "대한Heloo".isalpha())  # True
        print("11. 문자로만 구성?", "12".isalpha())   # False
        print("11. 숫자로만 구성?", "12".isnumeric())   # True
        
        print("12. S.find(sub[, start[, end]]) -> int")
        # start, end 생략 가능  # 시작 및 종료 범위 지정
        help(str.find)
        # s = "sequence"
        print("12. 검색위치1:", s.find('e')) # 1  # index 반환
        print("12. 검색위치2:", s.find('e', 2)) # 4
        print("12. 검색위치2:", s.find('x', 2)) # -1  # 찾지 못한 경우 -1 반환
        print("12. 검색위치3:", s.rfind('e')) # 7  # 여러 위치에 존재하는 경우, 가장 큰 index 반환
        
        print("13. join:", ",".join(["A", "B", "C"])) # A,B,C  # important!
        # 'iterable'.join(집합형 문자 데이터)
        
        # center, rjust, ljust -> SQL의 lpad, rpad와 유사
        print("14. center:", "Hello".center(20, "_")) # 20 자리수로 표시하고 _로 마킹
        print("15. rjust:", "Hello".rjust(20, "_")) # 20 자리수로 표시하고 _로 마킹  # SQL lpad
        print("16. ljust:", "Hello".ljust(20, "_")) # 20 자리수로 표시하고 _로 마킹  # SQL rpad
        
        print("17. capitalize:", "heLLOX".capitalize()) # 첫글자 대문자  # SQL initcap
        
        print("18. 멤버쉽 연산자1:", "H" in "Hello") # True
        print("19. 멤버쉽 연산자2:", "X" in "Hello") # False
        ```
        
    - 색인
        - indexing : 값 1개 추출
            
            ```python
            '''
            'hello' -> h | e | l | l | o
                                 #   0   1   2   3   4  # 순방향 indexing
                                 #  -5  -4  -3  -2  -1  # 역방향 indexing
            '''
            n = 'hello'
            n[0]  # h
            n[-5]  # h
            ```
            
        - slicing : 값 여러 개 추출
            - `n[start:end:step]`
            
            ```python
            # 범위 지정 (from ~ to)
            n[start : end]  # end는 출력 범위 내 미포함
            
            n[0 : 3]  # hel
            n[-4 : -1] # hel
            
            # step
            n[start:end:step]
            
            n[0:4:2]  # hl
            n[-4:-1] # hel
            
            # start, end, step 생략 가능
            
            # start 생략 -> 처음부터
            # end 생략 -> 마지막까지
            # step 생략 -> step 미적용
            
            # 아래와 같이, start/end를 생략한 step 적용도 가능
            n[:end:step]
            n[::step]
            ```
            
    - Unicode / bytes
        - Unicode string : 일반적으로 사용하는 문자열
        - Bytes string : Web 게시 시, bytes string으로 처리
        
        ```python
        # 1) unicode --> bytes (암호화 함수: encode 함수)
        s = "hello안녕하세요"
        help(str.encode)  # encode(self, /, encoding='utf-8', errors='strict')
        s2 = s.encode('utf-8')
        print(s, s2)  # hello안녕하세요 b'hello\xec\x95\x88\xeb\x85\x95\xed\x95\x98\xec\x84\xb8\xec\x9a\x94'
        print(type(s), type(s2))  # <class 'str'> <class 'bytes'>
        
        # 2_ bytes --> unicode (복호화 작업: decode 함수 - bytes 객체 함수)
        print(dir(bytes))
        '''
        ['capitalize', 'center', 'count', 'decode', 'endswith', 
        'expandtabs', 'find', 'fromhex', 'hex', 'index', 'isalnum', 
        'isalpha', 'isascii', 'isdigit', 'islower', 'isspace', 'istitle', 
        'isupper', 'join', 'ljust', 'lower', 'lstrip', 'maketrans', 
        'partition', 'removeprefix', 'removesuffix', 'replace', 'rfind', 'rindex', 
        'rjust', 'rpartition', 'rsplit', 'rstrip', 'split', 'splitlines', 
        'startswith', 'strip', 'swapcase', 'title', 'translate', 'upper', 'zfill']
        '''
        s3 = s2.decode("utf-8")
        print(s2, s3)  # b'hello\xec\x95\x88\xeb\x85\x95\xed\x95\x98\xec\x84\xb8\xec\x9a\x94' hello안녕하세요
        print(type(s2), type(s3))  # <class 'bytes'> <class 'str'>
        ```
        
- List data
    - List 생성 방법
        - `list()`
        - `[ ]`
        
            ```python
            n = [10, 20]
            n = [ ]  # empty
            n = list(set type date)
            n = [[1, 2], [3, 4]]  # nested list
            ```
        
    - List function
        - 삽입
            - `.append(object)` : 마지막 idx에 삽입
            - `.insert(idx, object)`: 특정 idx에 삽입
            - `.extend(iterable)` : 타 object의 모든 요소를 list에 삽입
        - 삭제
            - `.pop(idx)` : idx 지정을 통한 삭제
            - `.remove(value)` : 특정 value 지정을 통한 삭제
            - `.clear()` : list 전체 삭제
        - 특정 요소 확인
            - `len(list)`: list 요소의 개수 확인
            - `list.count(n)` : 특정 요소의 개수 확인
            - `.index(n)` : 특정 요소의 idx 확인
        - idx 역순 배열
            - `.reverse()` : idx 역순 재배열 (in-place)
            - `resersed()` : idx를 역순 재배열한 object 생성 
        
            ```python
            # 추가 (마지막 idx에 삽입)
            m = [1,2,3]
            m.append(10)
            m.append([9,8])
            m.append((100,200))
            print("1. append:",m)  # [1, 2, 3, 10, [9, 8], (100, 200)]
            
            # 삽입 (첫 idx에 삽입)
            m.insert(0,100)
            m.insert(0,[4,5,6])
            print("2. insert:",m) # [[4, 5, 6], 100, 1, 2, 3, 10, [9, 8], (100, 200)]
            help(m.insert)  # insert(index, object, /)
            
            # 병합 ( extend 또는  + )
            # 동일 형태의 데이터만 병합 가능 - set type + set_type
            # append와 다르게 iterable을 해체하여 추가
            x = [1,2,3]
            x.extend([10])
            x.extend([9,8])
            x.extend("XYZ")
            
            x.extend((7,))  # tuple - 1개의 iterable을 가진 tuple은 (7,) 형태로 입력
            # tuple도 set type이므로 해체 후 list에 병합 가능
            k = (10)
            k2 = (10,)
            print(type(k), type(k2))  # <class 'int'> <class 'tuple'>
            
            print("3. extend:",x) # [1, 2, 3, 10, 9, 8, 'X', 'Y', 'Z', 7]
            
            # 리스트 삭제
            '''
            list.pop(idx)
            list.remove(value)
            list.clear() - 전체 삭제
            '''
            
            kk4 = [1,2,3,4]
            kk4.pop()  # pop(-1) 과 동일  # pop default = -1
            kk4.pop(0)  # idx를 통한 위치 지정
            print("9. pop 함수(위치)",kk4)
            
            kk4.remove(2)  # 값에 의한 삭제
            print("10. remove(값): ", kk4)
            
            del kk4[0]  # 위치에 의한 삭제
            print("11. del(위치)", kk4)
            
            kk4.clear()  # 전체 삭제
            print("12. clear: " , kk4)
            
            # etc
            print("4. 리스트 길이:" , len([1,2,3,4]))
            print("5. 포함 갯수:" , [10,2,3,2,9,2].count(2))
            
            x3 = [100,200,300]
            print("6. 특정 위치:" , x3.index(200))  # list에서는 find가 아닌 index 사용
            print("7. 포함 여부1:" , 9 in [9,8,7])
            print("7. 포함 여부2:" , 6 in [9,8,7])
            
            x = [1,2,3]
            x.reverse()  # index 순서 역순 재배열 (원본 수정)
            print("8. 거꾸로(자신이 변경):" , x)  # [3, 2, 1]
            
            # 단, bulit-in에서는 reversed(객체) - 원본은 유지, 복사본 반환
            y = reversed(x)  # 뒤집힌 새로운 객체 반환
            print("8. 거꾸로(새로운 객체반환):", x, list(y))  # [3, 2, 1] [1, 2, 3]
            ```
        
    - Sorting
        - `.sort()` : 요소 정렬 (default : reverse = False)
        
            ```python
            # list.sort() ==> list 원본 정렬
            xxx = [88,2,5,3,9,7,10]
            xxx.sort()  # in-place로 동작
            print("13. 오름차순 정렬:",  xxx)
            xxx.sort(reverse=True)  #역순으로 정렬
            print("13. 내림차순 정렬:",  xxx)
            
            yyy = ['123', '9999', '43']
            yyy.sort()
            print("14. 기본 문자열 정렬:",  yyy)  # ['123', '43', '9999']
            yyy.sort(key=int)  # key = sorting 기준 지정 (함수명 입력)
            print("14. 문자형을 수치형으로 변환하여  정렬:",  yyy)  #문자열이지만 숫자형으로 정렬
            zz = ['홍길동','김', '박혁거세']
            zz.sort(key=len, reverse=True)
            print("14. 길이에 따라서  정렬:",  zz)  # ['김', '홍길동', '박혁거세']
            
            # sorted(list) ==> 원본 유지, 복사본 반환 (built-in)
            zzz = [3,1,2]
            zzz2 = sorted(zzz)
            zzz3 = sorted(zzz,reverse=True)
            print("15. 정렬전:",  zzz )
            print("15. 정렬후 1:",  zzz2 )
            print("15. 정렬후 2:",  zzz3 )
            print("15. 원본 정렬후:",  zzz)
            ```
        
    - 색인
        - `list[start : end : step]`
            - `list[:]` : 전체 복사
            - idx 역순 지정 가능
        
            ```python
            # 1차원 리스트
            arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
            print("original: ", arr)  # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
            print("all: ", arr[:])    # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
            
            print("reverse: ", arr[::-1])  # [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
            print("1 부터 끝까지: ", arr[1:])  # [2, 3, 4, 5, 6, 7, 8, 9, 10]
            print("0 부터 5까지: ", arr[:6])   # [1, 2, 3, 4, 5, 6]
            print("2 부터 5까지: ", arr[2:6])  # [3, 4, 5, 6]
            print("맨 마지막: ", arr[-1])     # 10
            print("맨 마지막에서 두번째 : ", arr[-2])     # 9
            
            # 2차원 리스트
            arr = [[1, 2, 3, 4, 5], [10, 20, 30, 40, 50]]
            print("original: ", arr)  # [[1, 2, 3, 4, 5], [10, 20, 30, 40, 50]]
            print("all: ", arr[:])  # [[1, 2, 3, 4, 5], [10, 20, 30, 40, 50]]
            print("arr[0]: ", arr[0]) # [1, 2, 3, 4, 5]
            print("arr[1]: ", arr[1]) # [10, 20, 30, 40, 50]
            print("arr[0][:3] ", arr[0][:3] ) # [1, 2, 3]
            ```
        
- Tuple data
    - Tuple 생성 방법
        - `tuple(value)`
        - `( )`
            ```python
            xx = (10, 20, 30, 43)
            xx2 = tuple([9, 8, 7, 7, 6, 8, 9])
            xx3 = (100,)  # 값 하나 가진 튜플 생성
            print(xx, xx2) # (10, 20, 30, 43) (9, 8, 7, 7, 6, 8, 9)
            print(tuple("hello")) # ('h', 'e', 'l', 'l', 'o')
            ```
        
    - Tuple function
        - `len`, `.count()`, `.index()`, `in` 사용 가능
            ```python
            print("튜플 길이:" , len((1, 2, 3, 4)))
            print("포함 갯수:" , (10, 2, 3, 2, 9, 2).count(2))
            x3 = (100,200,300)
            print("특정 위치:" , x3.index(200))
            print("포함 여부1:" , 9 in (9,8,7))
            print("포함 여부2:" , 6 in (9,8,7))
            print()
            ```
        
    - 색인
        ```python
        kk = (1,2,3,4,5)
        print("특정 값:" , kk[0])
        print("slice:" , kk[0:3])
        print("slice:" , kk[:6])
        print("slice:" , kk[3:])
        print("slice:" , kk[:])
        print()
        
        kk3 =(1,2,3,(9,8,7))
        print("중첩 :" , kk3)
        print("특정 값 출력1:" , kk3[3][0])
        print("특정 값 출력2:" , kk3[3][2:])
        print("특정 값 출력3:" , kk3[3][:2])
        ```
        
- Set data
    - Set 생성 방법
        - `set(value)`
        - `{ }`
        ```python
        # immutable value만 저장 가능 - scalar, str, tuple
        
        m = {1, 2, 3, 1}  # {1, 2, 3}
        m2 = set()  # set()
        print(m, m2)  # {1, 2, 3} set()
        print(set("hello"))  # {'e', 'o', 'l', 'h'}
        
        # 여러 요소값 저장 가능하지만 mutable 값 저장 불가
        m3 = {10,20,"홍길동",(100,200)}
        print(m3) # {10, 20, '홍길동', (100, 200)}
        #m4 = {10,20,"홍길동",[1,2]}  # mutable 데이터인 list 저장 불가
        # print(m4)  # error
        #print(m*2) # error , 반복출력 불가
        ```
        
    - Set function
        - 추가
            - `.add()` : immutable object 추가
        - 연산
            - `.undate()` : 타 object의 모든 요소를 set에 삽입
        - 삭제
            - `.discard()` : 특정 요소 삭제 (If the element is not a member, do nothing.)
            - `.remove()` : 특정 요소 삭제 (If the element is not a member, raise a KeyError.)
            - `.pop()` : 임의의 요소 삭제 (# random remove (no index in set)  #  Raises KeyError if the set is empty.)
        - 함수
            - `len`, `in`, `.clear()` 사용 가능
        - set operator 및 함수
            - `a.union(b)` : a, b의 합집합 (`|=`)
            - `a.intersection(b)` : a, b의 교집합 (`&=`)
            - `a.difference(b)` a, b의 차집합 (`-=`)
            - `a.symmetric_difference(b)` : a, b의 대칭 차집합 (`^=`)

        ```python
        print(dir(set))  # set 객체 - not duplicable
        '''
        ['add', 'clear', 'copy', 'difference', 'difference_update', 'discard',
        'intersection', 'intersection_update', 'isdisjoint', 'issubset', 
        'issuperset', 'pop', 'remove', 'symmetric_difference',
        'symmetric_difference_update', 'union', 'update']
        '''
        
        # 1) 값 추가 ==> 반드시 immutable 만 가능
        m = {1,2,3}
        m.add(10)
        m.add("홍길동")
        m.add((9,8))
        print("add:", m)  # {1, 2, 3, 10, (9, 8), '홍길동'}
        
        # 2) union 연산 - update
        m2 = {1,2}
        m2.update({3,4})
        print("update1_set:", m2) # {1, 2, 3, 4}
        m2.update([5,6,7])  # set type에 저장된 데이터를 추출하여 병합 연산
        print("update2_list:", m2) # {1, 2, 3, 4, 5, 6, 7}
        m2.update((9,10))
        print("update3_tuple:", m2) # {1, 2, 3, 4, 5, 6, 7, 9, 10}
        
        # 3) 삭제 ==> discard, remove, pop
        m2 = {1,2,3,4}
        m2.discard(4)  #  If the element is not a member, do nothing.
        print(m2)
        m2.remove(3)  #  If the element is not a member, raise a KeyError.
        print(m2)
        m2.pop()  # random remove (no index in set)  #  Raises KeyError if the set is empty.
        print(">>>>>>>>>>>>>>>>>", m2)
        
        # 4) set 함수
        print("set 길이:" , len({1,2,3,4,5}))  # 5
        x3 = {100,200,300}
        print("포함 여부1:", 9 in {9,8,7})  # True
        print("포함 여부2:", 6 in {9,8,7})  # False
        x3.clear()  # 전체 삭제
        print(x3)  # set()
        
        # 5) set 연산자 및 함수
        a = {1,2,3,1}  # {1, 2, 3}
        b = {3,4}
        print("union(합집합):", a.union(b))  # {1, 2, 3, 4}
        print("intersection(교집합):", a.intersection(b))  # {3}
        print("difference(차집합): ", a.difference(b))  # {1, 2}
        print("exclusive difference(대칭 차집합):",
                a.symmetric_difference(b))  # {1, 2, 4}
        ```
        
- Dict data
    - idx가 존재하지 않는 대신, key value를 이용하여 조회
    - 조회 속도가 매우 빠르기 때문에, 대량의 데이터 작성에 주로 사
    - JSON format과 유사
        - Java Script Object Notation
            - 프로그램 언어, OS, platform에 대해 독립적
        - 배열 형식 : [value1, value2]
        - 객체 포맷 : {key : value}
    - Dict 생성 방법
        
        ```python
        # dict 생성 - immutable key & mutable value
        m0 = {}
        m1 = dict()
        m2 = {'name': '홍길동1', 'age': 20}  # general way
        m3 = dict(name='홍길동2', age=20)  # key=value 형태
        
        # 2) dictionary function
        print(dir(dict))  # dict 객체
        ```
        
    - Dict function
        
        ```python
        # (1) dict 추가
        coffee = {'espresso':'에스프레소', 'latte':'라떼'}
        print(coffee)  # {'espresso': '에스프레소', 'latte': '라떼'}
        coffee['lungo'] = '룽고'  # 요소 추가
        print("요소추가:", coffee)  # {'espresso': '에스프레소', 'latte': '라떼', 'lungo': '룽고'}
        
        # (2) dict 변경 ==> 내부적으로 union으로 처리
        coffee['latte'] = '라떼2'
        print("요소변경:",coffee)  # {'espresso': '에스프레소', 'latte': '라떼2', 'lungo': '룽고'}
        
        # (3) dict 삭제 ==> del
        del coffee['lungo']  # 요소 삭제
        print("요소삭제1:",coffee)  # {'espresso': '에스프레소', 'latte': '라떼2'}
        
        coffee.pop('latte')  # 요소 삭제
        print("요소삭제2:",coffee)  # {'espresso': '에스프레소'}
        
        coffee.clear()  # 요소 전체 삭제
        print("요소전체삭제:",coffee)  # {}
        
        # (4) 병합 또는 한꺼번에 수정: update
        x = {'name':'유관순','age':20}
        y = {'address':'seoul'}
        x.update(y)
        print("병합1:",x) # {'name': '유관순', 'age': 20, 'address': 'seoul'}
        
        x.update({'name':'aaa2','age':202})
        print("한꺼번에 병합2:",x) # {'name': 'aaa2', 'age': 202, 'address': 'seoul'}
        
        #  (5) dict  정보 얻기
        coffee = {'espresso': '에스프레소', 'latte': '라떼'}
        print(coffee)
        print(len(coffee))  # 길이 출력, 2
        
        # key 정보를 가지고 있는 경우
        print(coffee['espresso'])  # 키를 이용해 값을 조회,  없으면 에러 , 에스프레소
        print(coffee.get('latte'))  # key로 value 얻기 , 라떼
        print(coffee.get('latt2e', 'Not a Coffee'))  # 해당 key 부재 시 출력값 지정 가능 (default = None)
        
        # key 정보가 없거나 너무 많은 경우
        print(coffee.keys())  # key 목록 출력, dict_keys(['espresso', 'latte'])
        keys = list(coffee.keys())  # list 형태의 key 목록으로 지정
        print(coffee[keys[0]], coffee['espresso'], coffee.get(keys[0]))  # 에스프레소 에스프레소 에스프레소
        
        # value값만 조회
        print(coffee.values())  # value 목록 출력, dict_values(['에스프레소', '라떼'])
        print(coffee.items(), list(coffee.items()))
        # key, value 출력
        # dict_items([('espresso', '에스프레소'), ('latte', '라떼')]) [('espresso', '에스프레소'), ('latte', '라떼')]
        
        # (6) 두 개의 자료구조를 하나로 묶음 ==> 짝이 안맞는 것은 제외됨.
        a = ['a', 'b', 'c']
        b = [10, 20, 30, 40]
        print(dict(zip(a, b)))  # {'a': 10, 'b': 20, 'c': 30}
        ```
        
- 집합 자료형 변환
    
    ```python
    '''
        str(value) : str로 변경
        list(value): list로 변경
        tuple(value): tuple로 변경
        set(value): set으로 변경
        dict(value): dict로 변경
    '''
    
    # list -> tuple,set
    a = [10, 20, 30, 30]
    a2 = tuple(a)
    a3 = set(a)
    print(a)  # [10, 20, 30, 30]
    print(a2)  # (10, 20, 30, 30)
    print(a3)  # {10, 20, 30}  # 중복 제거 시 사용
    
    # set -> list, tuple
    a = {10, 20, 30}
    a2 = list(a)
    a3 = tuple(a)
    print(a)  # {10, 20, 30}
    print(a2)  # [10, 20, 30]
    print(a3)  # (10, 20, 30)
    
    # tuple -> list, set
    a = (10, 20, 30)
    a2 = list(a)
    a3 = set(a)
    print(a)  # (10, 20, 30)
    print(a2)  # [10, 20, 30]
    print(a3)  # {10, 20, 30}
    
    # dict -> list,set,tuple (key만 추출)  # 형변환은 거의 사용하지 않음
    a = {"name":"홍길동","age":100}
    a2 = list(a)
    a3 = set(a)
    a4 = tuple(a)
    print(a)
    print(a2) # ['name', 'age']
    print(a3) # {'name', 'age'}
    print(a4) # ('name', 'age')
    
    # str --> list , tuple
    print(list("홍길동길"))  # ['홍', '길', '동', '길']
    print(tuple("홍길동길"))  # ('홍', '길', '동', '길')
    print(set("홍길동길"))  # {'길', '홍', '동'}
    ```
        
## **Statement**
- 실행문
- 순차 실행문 - 일반적인 코드
- 제어 실행문 (Dent 사용)
    - 조건문 : True / False 조건에 따른 실행 문장 구분 (분기)
        - 단일 if문
            - 조건에 따라 실행 여부가 결정되는 문장
            - True인 경우에만 indent 된 문장을 실행
                
                ```python
                num = int(input('input number'))
                
                if (num % 2 == 0) and (num > 10):
                    print(num)
                ```
                
                - Ture/False 대신 연산식을 주로 사용 (비교연산자, 논리연산자, 멤버십연산자)
                - True/False 연산식 논리 판단값을 기준으로 입력 가능
                    
                    ```python
                    # True/False 형식이 아님에도 False로 처리하는 값 - if[] -> if False
                    0
                    " "
                    None
                    []
                    {}
                    set()
                    ```
                    
        - if ~ else문
            - 조건에 따라 실행되는 문장이 다른 경우 사용
            - 각 조건별로 indent된 문장이 영향을 받음
            - 코드 구현에 따라 elif OR elif - else 문으로 종료
                
                ```python
                pocket = ['paper','card','tel']
                if 'tel' in pocket:
                    print("tel")
                else:
                    print("None")
                print("-------------------------")
                ```
                
        - 다중 if문
            - 중첩 if문 작성 가능
                
                ```python
                num = 85
                if num >= 90:
                    print("우수")
                else:
                    if num >= 70:
                        print("보통")
                    else:
                        print("저조")
                ```
                
        - 3항 연산자
            
            ```python
            print("True" if True else "False")
            
            # 중첩 가능
            n = 4
            m = "A" if n > 90 else "B" if n > 80 else "C"
            # n이 80보다 큰 경우, if문 앞의 3항 연산자에 대한 연산을 실행
            print(m) # Good day
            ```
            
    - 반복문 : True / False 조건에 따른 반복 실행
        - for문
            - 특정 문장을 반복 처리
                - dummy 변수 사용 가능
                - 단순 횟수에 기반할 때는 range(n) 사용
                    
                    ```python
                    for _ in list_A:    # _ : dummy variable
                        print('statement')
                    ```
                    
            - 집합형에 저장된 값을 반복하여 처리
                
                ```python
                for n in {100, 200, 300, 300}:
                    print(n, end=" ")
                
                for s in "abcde":
                    print(s)
                ```
                
            - enumerate - idx와 value를 함께 반환 (순서 확인)
                
                ```python
                for idx, n in enumerate([10, 20, 30]):
                    print(idx, n)
                # 0 10
                # 1 20
                # 2 30
                
                for idx, s in enumerate([10, 20, 30], 1):   # 반환 시, 시작 idx를 1로 지정
                    print(idx, s)
                # 1 10
                # 2 20
                # 3 30
                ```
                
            - dict for 반복문
                
                ```python
                # items(), .keys(), .values() 사용 시, 각 dummy 변수 개수에 유의
                
                soft = {'java':'웹용', 'python':'만능언어', 'oracle':'db처리'}
                
                for key, value in soft.items():
                    print(key + ':  ' + value, end=" ")
                print()
                # java:  웹용 python:  만능언어 oracle:  db처리
                
                for key in soft.keys():
                    print(key + ':  ' + value, end=" ")
                print()
                # java:  db처리 python:  db처리 oracle:  db처리
                
                for value in soft.values():
                    print(key + ':  ' + value, end=" ")
                print()
                # oracle:  웹용 oracle:  만능언어 oracle:  db처리
                ```
                
            - break, continue
                - break : 반복문 종료 시 사용
                - continue : 일부 반복 문장을 특정 회차에서 skip 시 사용
                
                ```python
                datas = [1, 2, 3, 4, 5]
                
                for i in datas:
                    if i == 3: continue   # i == 3일 때, 반복문 skip
                    if i == 4: break      # i == 4일 때, 전체 반복문 종료
                    print(i, end=' ')
                print("end")    # 반복문 종료 후 실행
                
                for i in datas:
                    if i == 4: break
                    print(i, end=' ')
                else:  # 정상적인 반복문 종료시 실행 (optional) (break 시 미실행)
                    print("정상종료")
                print("end")
                ```
                
            - list comprehension
                
                ```python
                # varible = [expression for variable in set-type]
                
                x = [n + 1 for n in [1, 2, 3]]
                print(x)    # [2, 3, 4]
                
                x = [n > 2 for n in [1, 2, 3]]
                print(x)    # [2, 3, 4]
                
                x = [n.upper() for n in ["A", "b", "C"]]
                print(x)    # [2, 3, 4]
                
                m = ["A", "b", "C"]
                k = []
                for m2 in m:
                    m3 = m2.upper()
                    k.append(m3)
                print(k)
                
                # 2) varible = [expression for variable in set-type if condition]
                x = [n for n in range(1, 11) if n % 2 == 0]
                print(x)
                
                # 3) varible = [ternary expression fpr variable in set-type]
                x = [0 if n % 2 ==0 else 1 for n in range(1, 11)]
                print(x)
                ```
                
            - dict comprehension
                
                ```python
                x = {"대한민국" : "서울", "미국" : "워싱턴", "중국" : "베이징"}
                
                x2 = {v: k for k, v in x.items()}
                print(x2)   # {'서울': '대한민국', '워싱턴': '미국', '베이징': '중국'}
                
                x2 = {k:len(v) for k,v in x.items()}
                print(x2)   # {'대한민국': 2, '미국': 3, '중국': 3}
                
                # 국가명이 2글자인 경우에만 반환
                x2 ={k: v for k, v in x.items() if len(k) == 2}
                print(x2)   # {'미국': '워싱턴', '중국': '베이징'}
                
                # 국가명 중, 대한민국은 korea로 표시
                x2 = {"korea" if k == "대한민국" else k for k, v in x.items()}
                print(x2)   # {'미국', 'korea', '중국'} # dict는 non-idx
                ```
                
            - generator comprehension
                
                ```python
                '''
                    generator comprehension
                
                    => dict로부터 가공하여 새로운 dict로 반환하는 기능
                
                    1. varible = (표현식 for 변수 in 집합형)
                    2. 한번에 실행 불가 - 단계적 실행
                        - next() 함수를 이용하여 단계적으로 값을 반환
                    3. 모든 값을 메모리에 담고 있지 않고 반환 시에만 생성(generator)
                        - 한 번에 한 개의 값만 순환(iterate) 가능
                        - Gigabytes 수준의 데이터를 처리하는 딥러닝, 머신러닝 분야에서 사용
                    4. list comprension은 [ ] 를 사용하는 반면,
                        generator expression은 ( ) 를 사용 
                '''
                
                list_x = [n for n in [1, 2, 3]]
                generator_x = (n for n in [1, 2, 3])
                print(type(generator_x))    # <class 'generator'>
                
                print("list comprehension:", list_x)    # [1, 2, 3]
                print("generator comprehension:", generator_x) # <generator object <genexpr> at 0x0000022D31586C20>
                
                print(next(generator_x))    # 1
                print(next(generator_x))    # 2
                print(next(generator_x))    # 3
                ```
                
        - while문
            - 정상적 반복 처리를 위한 3가지 요소 (or not, infinite loop)
                - 시작값 : e.g., variable = 1
                - 조건식 : e.g., variable < 5
                - 증가/감소 연산자
            - do while문은 지원하지 않음
            
            ```python
            '''
                    초기값
                    while 조건식:
                        문장
                        증감식
            '''
            
            n = 1
            
            while n < 6:
                print("hello")
                n += 1
            print("end")
            ```
            
- 비실행문
- Comment : #
- Multiline comments : “””  “””

- Function
- 기능 처리 담당
- 사용자/시스템 생성 함수
    - 사용자 생성 함수
        
        ```python
        def func_name([para1, para]):   # [ ] : 생략 가능
                statement
                [return return_value]
        ```
        
    - 시스템 생성 함수 (built-in)
- 특징
    - 호출을 통한 실행만 가능
    - 실행 후에는 호출된 곳으로 복귀
    - 기본적으로 paprameter와 argument의 개수가 동일
        - 단, default 지정 시에는 예외 적
    - Return value는 1개만 가능
        - 여러 개의 값을 return할 때는 집합형으로 변환
        
        ```python
        # 1. No parameter, no return
        
        def fun():
            print("fun")
        
        fun()
        print("end")
        
        # 2. parameter, no return
        def fun2(n, n2):
            print("fun2", n, n2)
        
        fun2(10, "홍길동")
        fun2([1, 2, 3], {"a": 20})
        
        # 3. no parameter, return
        def fun3():
            print("fun3")
            return 100
        
        result = fun3()
        print(result)
        
        def fun4():
            print("fun4")
            return 100, 200
        
        result = fun4()
        print(result) # (100, 200) - tuple
        
        # 4. parameter, return
        
        def fun5(n, n2):
            print("fun5")
            return n + n2
        
        result = fun5(10, 20)
        print(result)
        ```
        
- Variable
    - Global/local variable
        
        ```python
        '''
            python의 변수는 함수 scope에 종속
            => 함수 안에서 선언된 변수는 함수 내에서만 사용 가능
        '''
        
        n = 10  # global variable (전역 변수)
        
        def fun():
            n2 = 20     # local variable (지역 변수)
            print("n:", n)
            print("n2", n2)
        
        fun()
        print("n:", n)
        ```
        
    - Default_parameter
        
        ```python
        '''
            default parameter
        
            def func_name(n = default, n2 = default):
                pass
        '''
        
        def fun(n = 10, n2 = 20):
            print(n, n2)
        
        fun()
        fun(100)
        fun(100, 200)
        ```
        
    - Packing parameter
        
        ```python
        '''
            packing parameter
        
            def func_name(n, *n2):
                pass
        
            - 나머지 값을 모두 tuple로 저장하여 *n2에 전달
        '''
        
        # parameter 선언
        n, *n2 = 1, 2, 3, 4, 5
        print(n, n2)
        print(type(n2))
        
        def fun(n, *n2):
            print(n, n2)
        
        fun(10, 20)     # 10 (20,)
        fun(10, 20, 30, 40)     # 10 (20, 30, 40)
        
        def fun2(n, x, *n2):
            print(n, x, n2)
        
        fun2(10, 20, 4, 5, 6)   # 10 20 (4, 5, 6)
        
        # default + packing 혼합 가능
        def fun3(n = 10, x = 20, *n2):
            print(n, x, n2)
        
        fun3()      # 10 20 ()
        fun3(1, 2, 3, 3, 4, 5)      # 1 2 (3, 3, 4, 5)
        ```
        
    - Named parameter
        
        ```python
        '''
            named parameter
        
            def fun(age, username):
                pass
        
            fun(10, '홍길동')
            #fun('홍길동',10)
        
            fun(age=10, username='홍길동')
        
            - parameter name을 지정하여 사용
        
        '''
        
        def fun(age, username):
            print(age, username)
        
        fun(10, "홍길동")
        fun(age=10, username='홍길동')
        fun(username='홍길동', age=10)
        
        # default + named parameter - **을 통해 named parameter를 dict 형태로 출력
        
        def fun2(**n):
            print(n)
        
        fun2(age=10)
        fun2(age=10, username='홍길동')
        fun2(age=10, username='홍길동', address="서울")
        
        # 혼합 - *지정 후, **지정 (순서 유의)
        def fun3(n=1, n2=2, *n3, **n4):
            print(n, n2, n3, n4)
        
        fun3(10, 20, 30, age=10, username='홍길동')
        fun3(10, 20, 30, 40, 50, age=10, username='홍길동')
        fun3()
        ```
        
- First-class citizen (1급 객체)
    - 함수도 일반형 데이터에 해당
        - 모든 요소는 "할당 명령문의 대상"이 될 수 있음
        - 모든 요소는 "동일(equal, ==) 비교의 대상"이 될 수 있음
        - 모든 요소는 "함수의 파라미터"가 될 수 있
        - 모든 요소는 "함수의 반환 값"이 될 수 있음
    
    ```python
    # 1. 함수는 데이터이므로 변수에 저장 가능
    def fun():
        print("fun")
    
    print(fun)    # <function fun at 0x00000163C8FE04A0>
    n = fun
    n()    # fun
    
    # 2. 함수는 데이터이므로 함수 호출 시 인자값으로 사용 가능
    # callback function
    # 사용자가 아닌 시스템이 특정 시점에 호출하는 함수
    # callback function 구현을 위해 함수명을 명시
    # 사용자는 시스템이 호출할 함수명만 명시하고, 시스템이 특정 시점에 함수를 호출
    
    def x():
        print("x")
    
    def y(n):
        n()
    
    y(x)    # y 함수를 호출하였으나 실제로는 x 함수가 반응 (trigger)
    
    # 3. 함수는 데이터이므로 함수 리턴값으로 사용 가능
    def k():
        print("k")
    
    def k2():
        return k
    
    result = k2()
    result()
    ```
    
- lambda function
    - 단일 문장인 함수를 변환하여 사용 가능
    
    ```python
    '''
        lambda 표현식
        - def 함수명() 문법을 이용한 함수 작성의 또 다른 표현식
        - 반드시 단일 문장인 경우에만 lambda 표현식 가능
        - 익명 함수이므로 변수에 저장 후 호출하여 사용 (first-class이므로 가능)
    '''
    
    # 1. no parameter, no retrun
    
    def fun():
        print("fun")
    
    # lambda 표현식
    fun = lambda: print("lambda fun")
    fun()
    
    # 2. parameter, no return
    def fun2(n, n2):
        print("fun2", n, n2)
    
    # lambda 표현식
    fun2 = lambda n, n2: print("fun2", n, n2)
    fun2(10, 20)
    
    # default parameter 지정 가능
    fun2 = lambda n = 10, n2 = 20: print("lambda fun2", n, n2)
    fun2()
    
    # packing parameter
    fun2 = lambda n = 10, n2 = 20, *n3: print("lambda fun2", n, n2, n3)
    fun2(10, 20, 30, 40, 50, 60)
    
    # named parameter
    fun2 = lambda n = 10, n2 = 20, *n3, **n4: print("lambda fun2", n, n2, n3, n4)
    fun2(10, 20, 30, 40, 50, 60, age=20, address="서울")
    
    # 3. no parameter, return
    def fun3():
        return 100
    
    # lambda 표현식
    fun3 = lambda: 100
    result = fun3()
    print("lambda fun3", result)
    
    # 4. parameter, return
    def fun4(n, n2):
        return n + n2
    
    # lambda 표현식
    fun4 = lambda n, n2: n + n2
    result = fun4(1, 2)
    print("lambda fun4", result)
    ```
    
- generator function
    - 함수 호출 시, 함수 내 문장을 next()를 통해 단계적으로 실행
- Class (객체)
- 사용 목적
    - 객체의 구조와 행동을 정의
    - 객체의 클래스를 초기화를 통해 제어
    - 복잡한 문제를 쉽게 제
- 용어
    - Class : 제품의 설계도
    - Object(객체) : 설계도로 만든 제품
    - Attribute : Class 내 변수
    - Method : Class 내 함수
    - Constructor(생성자) : 객체 생성 시 실행되는 함수
        - `def __init__(parameter)` : 클래스 내에서 사용할 object 초기화 method
        - 객체화 시 바로 수행할 내용을 작성
    - Instance : 메모리에서 유효한 객체 (객체에 포함된 객체)
        - 객체 생성 시, 매번 생성되는 객체
- 문법
    - Class 내에서 생성자, method, 변수 사용
    - 생성자/메서드 - 함수
        - 기능 처리 역할
    - 변수
        - 데이터 저장 역할
    - Instance
        
        ```python
        def method(self):
                        pass # instance method(regular metohd)
                                # 'method.'를 통해 접근
        ```
        
    - Decorator
        - 기존 function/class를 input으로 하여 일련의 작업을 수행한 후, 변경된 function/class를 반환
        - `@staticmethod` : Class의 static method로 선언
            - Class와 관련이 있어 class 내에 위치하나,
            class 혹은 instance object와는 독립적으로 동작하는 함수를 생성
                - 날짜 및 시간 정보 제공, 환율 정보 제공, 단위 변환 등
            - Function 정의 시, parameter로 self 미사용
            
            ```python
            @staticmethod
            def method1([element1, element2, ...]):
                <code block>
            
            # 주로 Object 생성 없이 class name을 이용하여 method 호출
            class_name.method1([element1, element2, ...])
            
            ```
            
        - `@classmethod` : Class의 class method로 선언
            
            ```python
            @classmethod
            def method(cls): # classmethod, 'class.'를 통해 접근
                                pass 
            
            # Object 생성 없이 class name을 이용하여 method 호출 가능
            class_name.method1([element1, element2, ...])
            ```
            
        - `@property` : Class 내 method를 attribute로 접근
- 객체 생성
    - 클래스 사용을 위해 객체를 생성하여 메모리에 저장
    - Variable_name = Class_name( )
- 객체 지향 프로그래밍 (OOP: Object-oriented programming)
    - Java, Python, etc.
    - Object(객체)
        - 현실에 존재하는 사물을 의미
        - 가상환경에서의 object 표현
            - Class : Monitor (객체)
            - Variable : 색상, 밝기, 가격 등 (속성)
            - Method : on/off (기능)
    - OOP의 속성
        - 상속
            - Objcet가 타 object로부터 상속받은 요소를 사용하는 것을 의미
            - 공통된 속성과 동작을 새로운 class로 상속하여 생성
                - 중복 제거에 효과적
            - Parent class - Child class
                - 혹은 Super class - Sub class로 표현
            - ‘is a’ 관계에서만 상속 가능
                
                ```python
                class Pet:
                    def __init__(self, n, a):
                        self.username = n
                        self.age = a
                
                class Cat(Pet):  # Cat is a Pet (상속 관계)
                    def __init__(self, n, a):
                        # parent class에서 object 초기화
                        super().__init__(n, a)    # super() : parent class의 method를 호출
                ```
                
            - mro method
                - 상속의 계층 구조를 list 형태로 반환
                - Method Resolution Order
                    
                    ```python
                    print(Cat.mro())
                    # [<class '__main__.Cat'>, <class '__main__.Pet'>, <class 'object'>]
                    ```
                    
        - 다형성
            - 본래 OOP는 동일 이름을 가진 method를 불허 (One for One)
                - 단, pythond과 C++는 다중 상속을 허용
            - 상속 및 재정의를 전제조건으로, 상속 요소가 다양한 하위 요소를 통합하여 사용
                - 일반화 : 상속을 통한 표현
                - 추상화 : 공통 특성을 선언
                
                ⇒ 일반화된 이름을 사용하여 재정의된 함수를 호출
                
                - Method orverride 또한 다형성 사
        - 은닉화 (캡슐화)
            - 객체의 일부 구현 내용에 대한 외부로부터의 직접 접근을 차단 (Class 외부 조회 불가)
            - 객체의 속성 및 그 기능을 하나로 묶는 것
            - Class 내에서 instance variable 앞에 access modifier를 적용하여 구현
                - `__`(dunder) :  변수 은닉화 (incapsulation), class 내에서만 접근 가능
                - `_`(underscore) : class 및 해당 class를 상속한 child class에서 접근 가능
        - 추상화
            - 객체의 공통 속성과 기능을 추출하여 정의
            - 추상화 시 type hinting 권장
                
                ```python
                # 변수의 type hinting
                myval: float = 0.02    # 명시하지 않아도 사용 가능하나, 명시 권장
                
                # method return값의 type hinting
                def my_function (a:int, b:int) -> float
                ```
                
- Module & Package
- Module
    - 하나의 *py 파일을 의미
    - 서로 다른 module 간에는 접근 불가
    - import를 통해 접근 가능
        - system에서 제공되는 module을 사용하기 위해 반드시 import 필
- Package
    - 서로 연관된 module의 묶음 (window의 폴더 개념
- 예외 처리 (exception handling)
- 예외(exception)
    - 프로그램 실행 중 발생하는 문제
- 예외 처리
    - 비정상 종료 발생 지점을 포기하여 정상 종료가 가능하도록 하는 것
- 예외 class
    - Object
        - BaseException
            - Exception (예외 최상위 class)
                - Arithemetic Error
                    - ZeroDivision Error
                - Type Error
                - Value Error
- 문법
    
    ```python
    try:      # try block - 실행하고자 하는 문
        statement
    
                        # except 문장 - 예외 시 실행 문장
    except exception_class as alias:
        statement ...
    ```
    
- 다중 except
    
    ```python
    try:
        statement
        statement
    
    except exception_class as alias:
        statement ...
    
    except exception_class as alias:
        statement ...
    
    except exception_class as alias:
        statement ...
    
    except exception as alias:      # 예상하지 못한 error class를 모두 처리
        statement ...
    ```
    
- finally문
    - 반드시 실행되는 문장을 지정 (e.g., 외부 파일 or DB)
    
    ```python
    try:
        statement
        statement
    
    except exception_class as alias:
        statement ...
    
    except exception_class as alias:
        statement ...
    
    except exception_class as alias:
        statement ...
    
    finally:      # error 여부에 관계없이 반드시 실행되는 문장
        statement ...
    ```
    
- JSON 처리
- JavaScript, Object, Notation
- JSON to Str ⇒ json.dumps(JSON)
    - list → str
    - dict → str
- Str to JSON ⇒ json.loads(str)
    - str(list) → list
    - str(dict) → dict