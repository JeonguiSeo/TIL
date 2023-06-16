# NumPy

## NumPy :  vectorized operation 지원
- Python에서 지원하지 않는 element간 연산 지원
- 다차원배열간 산술연산, 다차원배열 및 scalar간 산술연산 지원
- 비교연산 가능 : True/False boolean indexing
    - 색인 대상과 동일 길이 필요
    - 연산자는 and/or/not 대신 `&`(and), `|`(or), `~`(not) 사용

        ``` python
        import numpy as np
        ### python basic 연산
        # list + list
        print
        print([10,20,30]+[10,20,30])

        # list + scalar
        print([10, 20, 30] * 3)
        ```

## NumPy 연산
### vector + vector (shape 대응 필수)
```python
arr1D_1 = np.array([10, 20, 30])
arr1D_2 = np.array([5, 4, 3])

print(arr1D_1 + arr1D_2)
print(arr1D_1 - arr1D_2)
print(arr1D_1 * arr1D_2)
print(arr1D_1 / arr1D_2)
```

### vector + scalar (broadcasting 연산)
- broadcasting : 서로 다른 차원을 가진 두 개의 값 산술 시, 연산이 가능하도록 차원을 자동 일치화
```python
arr1D_1 = np.array([10,20,30])
print("4. numpy의 vector + scalar 연산 처리")
print(arr1D_1 + 2)  # [12 22 32]
print(arr1D_1 - 2)  # [ 8 18 28]
print(arr1D_1 * 2)  # [20 40 60]
print(arr1D_1 / 2)  # [ 5. 10. 15.]
```

## 비교 연산의 vectorizing
 - boolean 색인 적용 가능
```python
print(arr1D_1 % 3 == 0)
print(arr1D_1 > 15)
print((arr1D_1 > 15) & (arr1D_1 % 6 == 0))
```

## Vector 생성
### np.array(list)
- list로 ndarray 생성 시, dtype은 기존 list의 값으로 자동 지정
    - int의 기본 dtype : int32 (4bytes)
    - float의 기본 dtype : float64 (8bytes)
- np.array 시, ***ndarray class***로 변환
    - list type의 경우 print 시, element간 ',' 확인 가능
    - 반면 ndarray는 print 시, element간 ',' 확인 불가

### one dimensional array
```python
list_value = [10, 20, 30]
vector1 = np.array(list_value)
print(list_value, type(list_value))     # [10, 20, 30] <class 'list'>
print(vector1, type(vector1), vector1.dtype)    # [10 20 30] <class 'numpy.ndarray'> int32
```

### Upcasting
- Int와 flaot dtype을 함께 변환하는 경우, 보다 큰 범주의 dtype인 float으로 변환
```python
list_value = [10., 20, 30]      # float, int, int
vector1 = np.array(list_value)
print(vector1, type(vector1), vector1.dtype)    # int -> float
```

### 명시적 dtype 변경
- dtype 지정 시 `np.dtype` 형식 사용에 유의
```python
def array(p_object: ndarray | Iterable | int | float,
            dtype: object | None = None,
            *args: Any,
            **kwargs: Any) -> ndarray
```

```python
list_value = [10., 20, 30]      # float, int, int
vector1 = np.array(list_value, dtype=np.int32)
print(vector1, type(vector1), vector1.dtype)    # float -> int
```

### Vector 속성
- 차원(dimension,axis) 개수 : `.ndim`
- 차원의 크기(shape) : `.shape`
- 총 element 개수 (size) : `.size`
- 저장 데이터 type(dtype) : `.dtype`

### Randon function
- `np.random.random([Num])` : 0.0 <= n < 1.0 내 임의의 float 값 반환, 개수 생략 시 1 개 반환
- `np.random.rand([Num])` :  [0, 1) 범위 내 임의의 값 반환, 개수 생략 시 1 개 반환
- `np.random.randn([Num])` :  정규분포 표본 추출. 개수 생략 시 1개 반환
- `np.random.randint([Min], Max, Num)` : [Min, Max) 범위 내 임의의 정수 n개 반환
    - Min 생략 시 [0, Max)
- `np.random.choice(list)`  : 주어진 리스트에서 임의의 값 1개 반환
- `np.random.shuffle(list)`  :  주어진 리스트를 shuffle.  `inplace = True` 동작

### Vector - zeros, ones, empty, full
- `np.zeros(Num)` : Num개의 0.0으로 구성된 ndarray 반환
    - `default dtype = float64`
    - dtype paramenter를 통한 dtype 지정 가능
        - `dtype=np.int32`
- `np.ones(Num)` :  Num개의 1.0으로 구성된 ndarray 반환
    - `default dtype = float64`
    - dtype paramenter를 통한 dtype 지정 가능
        - `dtype=np.int32`
- `np.empty(Num)` : Num개의 임의의(arbitrary) 값으로 구성된 ndarray 반환
- `np.full(Num, value)` : Num개의 지정된 값으로 구성된 ndarray 반환

### arange
- `np.arange([start], stop[, step])` : python range와 동일한 기능 제공
    - 단 지정된 dtype에 따라 반환
    - `variable = np.arange(n)` : [0,n) 범위의 int ndarray 반환
        - n이 float인 경우, float 반환
    - `variable = np.arange(n, m)`	: [n,m) 범위의 int ndarray 반환
    - `variable = np.arange(n, dtype=np.float32)` : [0,n) 범위의 int ndarray 반환
        - `variable = np.arange(n)` : [0, n) 범위의 ndarray 반환

### linspace
- `np.linspace(start, stop, [num=50, endpoint=True])`
    - [start,stop] 범위 내 num개의 ndarray 생성
    - `dafault dtype = float64`
    - `default num = 50`
    - stop value를 범위에 포함
        - interval [`start`, `stop`].
        - stop value를 범위에 포함하지 않기 위해서는 `endpoint = False` 지정
        - `default endpoint = True`


## Vector 삭제
### ndarray 삭제
-  `arr = np.delete(arr, idx|fancy|slice, axis)`
    - `inplace = False` 동작으로 새로운 ndarray 반환
    - `axis=None` : flatten 적용
        - flatten : 다차원을 1차원으로 변경 
    - slice 사용 시,  `np.s_[::n]` 형식 적용
### value 지정을 통한 삭제
- `np.where((arr==5) | (arr==8))` : 조건에 일치하는 idx 반환
    - `np.where(boolean statements, 'if  Ture', 'if False)` : 조건에 따른 반환값 지정 broadcasting 가능
- `np.delete(arr, np.where((arr==5) | (arr=8)))` : idx 특정을 통한 삭제

## Vector 추가 및 삭제
### ndarray 추가
- `arr = np.append(arr, values, axis=None)`
    - `.append`를 통한 `inplace = False`실행
    - `axis = None` : flatten 적용 후 추가
### ndarray 삽입
- `arr = np.insert(arr, idx|fancy|slice, value,  axis )`
    - fancy | slicing 사용 시, 입력할 value와 shape의 일치 필수
    ```python
    new_arr = np.insert(arr, [0, 3, 1], [1, 2, 3])
    new_arr = np.insert(arr, np.s_[0:2], [1, 2])
    ```

## Matrix 생성
- Nested list
    - `arr2D = np.array([[ ], [ ]])`

- shape 사용
    - `arr1D.shape = (row, col)`
    - `arr1D.shape = (row, -1)` : row size에 의해 col size 자동 지정
    - `arr1D.shape = (-1, col)` : col size에 의해 row size 자동 지정
- 다차원 shape의 해석
    - (depth, row, col) 순으로 해석
        ```python
        arr1D = np.array([1, 2, 3, 4, 5, 6])
        arr1D.shape = (2, 3, 1)     # depth, row, col 지정
        
        print(np.shape(arr1D))  # (2, 3, 1)
        ```

### Matrix 속성
- 차원(dimension,axis) 개수 : `.ndim`
- 차원의 크기(shape) : `.shape`
- 총 element 개수 (size) : `.size`
- 저장 데이터 type(dtype) : `.dtype`

### Random function
- `np.random.random(size=(row, col))` : [0.0, 1.0) 범위 내 임의의 값으로 구성된 size의 matrix 반환
    - size 지정 시 tuple 형태임에 유의
- `np.random.rand(row, col)` : [0, 1) 범위 내 임의의 값으로 구성된 matrix 반환 
- `np.random.randn(row, col)` : 정규분포 내 임의의 값으로 구성된 matrix 반환
- `np.random.randint(Min, Max, size=(row, col))` : 최소(inclusive) ~ 최대(exclusive) 범위 내 임의의 정수 n개로 구성된 matrix 반환 
- `np.random.randint(Min, Max, size=(row, col))` :  [Min, Max) 범위 내 임의의 정수 n로 구성된 matrix 반환 (복원 추출)
    - Min 생략 시 [0, Max)


### Matrix - zeros, ones, empty, full
- `np.zeros((row, col))` : 0.0으로 구성된 matrix 반환
    - `default dtype = float64`
    - dtype paramenter를 통한 dtype 지정 가능
        - `dtype=np.int32`
- `np.ones((row, col))` : 1.0으로 구성된 matrix 반환
    - `default dtype = float64`
    - dtype paramenter를 통한 dtype 지정 가능
        - `dtype=np.int32`
- `np.empty((row, col))` : Num개의 임의의(arbitrary) 값으로 구성된 matrix 반환
- `np.full((row, col), value)` : 지정된 값으로 구성된 matrix 반환

### arrange reshape
`data = np.arange([start,] stop[, step,]).reshape((row, col))`: ndarray를 지정된 row, col의 matrix로 재배열

### Matrix 삭제
`arr = np.delete(arr, idx|fancy|slice, axis)` : 특정 idx가 삭제된 matrix 반환
- `inplace = False`
- slicing은 `np.s_[::2]` 형식 적용
- axis 미지정 시, flatten 적용
- `axix = 0` : row 제거
- `axix = 1` : column 제거

## Matrix 추가 및 삭제
### ndarray 추가
- `arr = np.append(arr, values, axis=None)` : ndarray가 추가된 새로운 matrix 반환
    - `axis = None` : flatten 적용 (dimension 불일치 허용)
    - `axis = 0` : row 추가 (shape 일치 필수)
    - `axis = 1` : column 추가 (shape 일치 필수)
### ndarray 삽입
- `arr = np.insert(arr, idx|fancy, value, axis)`
    - fancy 사용 시, 입력할 value와 shape의 일치 필수
    - 단, idx 지정 방식에 유의
        - `np.insert(arr, idx, ndarray|iterable, axis=1)` : 첫 번째 col에 ndarray의 차원을 유지한 채로 삽입
        - `np.insert(arr, [idx], ndarray|iterable, axis=0)` : 첫 번째 col을 1차원으로 지정하여, ndarray를 1차원화 후 채로 삽입
        ```python
        xxx = np.insert(arr, 0,  [[100], [200]], axis=1)
        print(xxx)
        '''
        [[100 200   1   2   3]
        [100 200   4   5   6]]
        '''
        xxx = np.insert(arr, [0], [[100], [200]], axis=1)
        print(xxx)
        '''
        [[100   1   2   3]
        [200   4   5   6]]
        '''
        ```

### dtype 변경
- 다차원 ndarray의 모든 element를 한번에 변경 (Vetorize)
#### dtype attribute 사용
- `arr = np.array(data, dtype=np.float64)`
- `arr = np.array(data, dtype=np.int64)`
- `arr = np.array(data, dtype=np.string_)`
- `arr = np.array(data, dtype=np.str_)`
    - bytes, str type 지정 시 주의
        - `np.string_` : bytes type
        - `np.str_` : str type

#### astype function 사용
- `arr = np.array(data).astype(np.int32)` : `.astype()` 사용을 통한 일괄 변경 가능

## Vector 연산
Vectorized operation
- numpy는 Python basic에서 지원하지 않는 element간의 연산을 지원
    ```python
    arr1D_1 = np.array([10, 20, 30])
    arr1D_2 = np.array([5, 4, 3])
    print(arr1D_1 + arr1D_2)  # [15 24 33]
    print(arr1D_1 - arr1D_2)  # [ 5 16 27]
    print(arr1D_1 * arr1D_2)  # [50 80 90]
    print(arr1D_1 / arr1D_2)  # [ 2.  5. 10.]
    ```
- Vector간 산술연산, vector & scalar 산술 연산
    ```python
    arr1D_1 = np.array([10, 20, 30])
    print(arr1D_1 + 2)  # [12 22 32]
    print(arr1D_1 - 2)  # [ 8 18 28]
    print(arr1D_1 * 2)  # [20 40 60]
    print(arr1D_1 / 2)  # [ 5. 10. 15.]
    ```
- 비교연산 가능 ==> True/False boolean 색인
    - 색인 대상과 동일 길이 필요
    - 기본 연산자 대신 `&`(and), `|`(or), `~`(not) 사용
    ```python
    print(arr1D_1 % 3 == 0)  # [False False  True]
    print(arr1D_1 > 15)    # [False  True  True]
    print((arr1D_1 > 15) & (arr1D_1 % 6 == 0))     # [False False  True]
    ```
- Vector + scalar 연산 시, broadcasting 지원
    ``` python
    arr1D_1 = np.array([10, 20, 30])
    print(arr1D_1 + 2)  # [12 22 32]
    print(arr1D_1 - 2)  # [ 8 18 28]
    print(arr1D_1 * 2)  # [20 40 60]
    print(arr1D_1 / 2)  # [ 5. 10. 15.]
    ```

## indexing
### One dimentional array
- Forward/reverse indexing
    ```python
    print(arr[0], arr[-1])
    ```
- Slicing indexing
    ```python
    print(arr[1:10:2])
    print(arr[:])
    print(arr[...])
    ```
- Fancy indexing
    - Nested format 사용에 유의
        ```python
        print(data[[1, 3, 5]])
        ```
- Boolean indexing
    - indexing 대상과 같은 길이 보유 필수
    - 색인 및 연산 가능
    - 기본 연산자 대신 `&`(and), `|`(or), `~`(not) 사용
        ```python
        data = np.array([1, 2, 3, 4, 5])

        print(data % 2 == 0)   # [False  True False  True False]
        print(data[[True, True, True, True, False]])  # [1 2 3 4]
        print(data[data % 2 == 0])  # [2 4]
        print(data[data > 3])  # [4 5]
        print(data[(data % 2 == 0) & (data > 2)])    # [4]
        print(data[(data % 2 != 0) | (data < 4)])     # [1 2 3 5]
        print(data[~(data > 3)])  # [1, 2, 3]
        ```
    - 특정 value 검색 및 list comprehension 가능
        ```python
        names = np.array(["A", "B", "C", "D", "B"])

        print(names == 'B') # [False  True False False  True]
        print(names[names == 'B'])    # ['B' 'B']
        print(type(names[names == 'B']))    # <class 'numpy.ndarray'>

        print([x for x in names if x == 'B'])     # ['B', 'B']
        ```

### Two dimentional array
- `arr[row, col]` 형식 적용
- Indexing & slicing
    ```python
    arr = np.array([[1, 2, 3], 
                    [10, 20, 30], 
                    [100, 200, 300], 
                    [1000, 2000, 3000]])

    print(arr[0])  # [1 2 3]
    print(arr[0, ...])    # [1 2 3]
    print(arr[-1])   # [1000 2000 3000]

    print(arr[0, 1])   # 2
    print(arr[0, -1])   # 3
    print(arr[0, 1:])    # [2 3]

    print(arr[:, 0])     # [   1   10  100 1000]
    print(arr[..., 0])   # [   1   10  100 1000]
    print(arr[:, 1:])    # [   2    3]

    print(arr[1:, 1:])
    '''
    [[  20   30]
    [ 200  300]
    [2000 3000]]
    '''
    ```

- Fancy indexing
    ```python
    arr = np.array([[1, 2, 3], 
                    [10, 20, 30], 
                    [100, 200, 300]])
    print(arr[[0, 2]])
    '''
    [[  1   2   3]
    [100 200 300]]
    '''

    print(arr[[0, 2], [1]])     # [  2 200]
    
    print(arr[[0, 2], 1:])
    '''
    [[  2   3]
    [200 300]]
    '''
    
    print(arr[:, [1, 2]])
    '''
    [[  2   3]
    [ 20  30]
    [200 300]]
    '''
    ```

- Boolean 색인
    - indexing 대상과 같은 길이 보유 필수
    - 실행 결과는 1차원으로 반환
    - 기본 연산자 대신 `&`(and), `|`(or), `~`(not) 사용
        ```python
        arr = np.array([[1, 2, 3], 
                        [10, 20, 30], 
                        [100, 200, 300]])        
        
        print(arr % 2 == 0)
        print(arr[arr % 2 == 0])      # [  2  10  20  30 100 200 300]
        print(arr[(arr % 2 != 0) | (arr < 100)])    # [ 1  2  3 10 20 30]
        ```

## Shqllow & deep copy
### Basic python copy
- Shallow copy : 주소값을 복사하여 복사본 변경 시, 원본 변경
    ```python
    x = [1, 2, 3]
    x2 = x
    ```
- Deep copy : 복사본 변경 시, 원본에 영향 없음
    - x3의 값을 변경하더라도 원본인 x는 영향을 받지 않음
    x3 = x[:]
    x3 = x.copy()
    x3 = list(x)
    
### numpy copy
- Shallow copy
    - `[:]` slicing을 shallow copy로 처리
    - 다른 주소값을 지정하나, view 형태로 연결
        - 복사본 변경 시, 원본 변경

- Deep copy
    - `np.copy(arr)`
    - `arr.copy()`


## Merge
- Column merge
    - `np.hstack((arr, arr2))` : horizontal merge
    - (tuple 형태 입력)
    - `np. concatenate((arr, arr2), axis=1)` : axis=1, column 방향 merge
    - `np. column_stack((arr, arr2))` : column 방향 merge

- Row merge
    - `np.vstack((arr, arr2))` : vertical merge
    - `np.concatenate((arr,arr2), axis=0)` : axis=0, row 방향 merge
    - `np.row_stack((arr, arr2))` : row 방향 merge

## Split
- Column split
    - `np.hsplit(arr, n)` : horizontal 방향 n개 분할
    - `np.split(arr, n, axis=1)` : column 방향 n개 분할
- Row split
    - `np.vsplit(arr, n)` : vertical 방향 n개 분할
    - `np.split(arr, n, axis=0)` : row 방향 n개 분할    

## Function
### Universal function
- Data element 개별 처리를 지원하는 범용 함수
- Universal function 확인 방법
    ```python
    print(np.add)   # <ufunc 'add'> ==> univeral function
    print(np.array)     # <built-in function array>
    ```

#### Unary ufunc
- 하나의 인자를 필요로 하는 함수
    - `np.abs(arr)` : 절대값 반환
    - `np.around(arr, n)` :반올림 반환
    - `np.round(arr, n)` : N 소수점 자릿수까지 반올림
    - `np.rint(arr)` : 가장 가까운 정수로 반올림
    - `np.fix(arr)` : 0에 가장 가까운 정수로 반환
    - `np.ceil(arr)` : 크거나 같은 가장 작은 정수값 반환
    - `np.floor(arr)` : 작거나 같은 가장 큰 정수값 반환
    - `np.trunc(arr)` : 소수점 절삭
    - `np.sqrt(arr)` : 제곱근 반환

    - `np.reciprocal(arr)` : 각 element의 역수 반환
    ```python
    print(np.reciprocal([1, 2, 3]))  # 1/1 1/2 1/3 ==> [1 0 0]
    print(np.reciprocal([1., 2., 3.]))  # 1/1 1/2 1/3 ==> [1.  0.5 0.33333333]
    ```

#### Binary ufunc
- 두 개의 인자를 필요로 하는 함수
    - `np.add(arr1, arr2)` :  + 연산과 동일
    - `np.subtract(arr1, arr2)` :  - 연산과 동일
    - `np.multiply(arr1, arr2)` :  * 연산과 동일
    - `np.divide(arr1, arr2)` :  / 연산과 동일
    - `np.floor_divide(arr1, arr2)` :  // 연산과 동일 ( 몫 연산 )
    - `np.mod(arr1, arr2)` :  % 연산과 동일 ( 나머지 연산 )
    - `np.maximum(arr1, arr2)` : 각 idx의 최대값 반환
    - `np.power(arr1, arr2)` : arr1의 arr2제곱값 반환
- Boolean idx 반환 함수
    - `np.greater(arr1, arr2)`
    - `np.greater_equal(arr1, arr2)`
    - `np.less(arr1, arr2)`
    - `np.less_equal(arr1, arr2)`
    - `np.equal(arr1, arr2)`
    - `np.not_equal(arr1, arr2)`

#### String function
- `np.char.string_function` format 사용 <br>
https://numpy.org/devdocs/reference/routines.char.html#module-numpy.char
    - `np.char.add(arr1, arr2)` : str 결합 반환
    - `np.char.multiply(arr1, arr2)` : 다중 str 결합 반환 (dtype(arr) => int)
    - `np.char.capitalize(arr1)` : 각 element의 첫 문자를 capitalize
    - `np.char.upper(arr)` : 각 element의 문자를 uppercase로 반환
    - `np.char.lower(arr)` : 각 element의 문자를 lowercase로 반환    
    - `np.char.swapcase(arr)` : 각 element의 upper/lowercase 반전 반환
    - `np.char.title(arr)` : 각 단어의 첫 문자를 uppercase로 반환 (white space 기준)
    - `np.char.center(arr1, width(int), fillchar='str')` : 문자를 center padding 후 반환
    - `np.char.ljust(arr1, arr2)` : 문자를 left padding 후 반환
    - `np.char.rjust(arr1, arr2)` : 문자를 right padding 후 반환
    - `np.char.encode(arr, 'encoding(str)')` : 문자를 지정된 방식으로 encoding
    - `np.char.decode(arr1, 'encoding(str)')` : 문자를 지정된 방식으로 decoding
    - `np.char.join("sep", arr)` : seq로 연결된 str 반환
    - `np.char.strip(arr[, 'str'])` : 공백 제거 후 문자 반환 (str 지정 시, 해당 문자로 공백 fill)
    - `np.char.lstrip(arr[, 'str'])` : 좌측 공백 제거 후 문자 반환 (str 지정 시, 해당 문자로 공백 fill)
    - `np.char.rstrip(arr[, 'str'])` : 우측 공백 제거 후 문자 반환 (str 지정 시, 해당 문자로 공백 fill)
    - `np.char.split(arr[, 'str'])` : 공백을 기준으로 문자 분리 (str 지정 시, 해당 문자로 분리)
    - `np.char.replace(arr, 'old_str', 'new_str'[, count=n])` : 특정 문자열 대체 (count 지정 시, 변경 개수 지정) 
    - `np.char.find(arr, 'str')` : 특정 문자의 각 idx 반환 
    - `np.char.count(arr, 'str')` : 특정 문자의 각 개수 반환
    - `np.char.startswith(arr, 'str')` : 특정 문자 시작 여부 boolean 반환
    - `np.char.endswith(arr, 'str')` : 특정 문자 종료 여부 boolean 반환
    - `np.char.equal(arr, 'str')` : 특정 문자와의 동일 여부 boolean 반환
    - `np.char.isdigit(arr)` : 특정 문자의 int 여부 booelan 반환
    - `np.char.isalpha(arr)` : 특정 문자의 str 여부 booelan 반환
    - `np.char.islower(arr)` : 특정 문자의 lowercase 여부 booelan 반환
    - `np.char.isupper(arr)` : 특정 문자의 uppercase 여부 booelan 반환
    - `np.char.rjust(arr, width=n)` : 문자를 좌측 정렬하고, width를 지정
    - `np.char.ljust(arr, width=n)` : 문자를 우측 정렬하고, width를 지정

#### Utility function
- axis를 이용한 row, col 연산 수행
    - `np.prod(arr[, axis=0|1])`: 각 array element간 곱연산 반환
        - axis=0 : row axis 기준 상하 연산
        - axis=0 : col axis 기준 좌후 연산
        - array 내 NaN 존재 시 연산 불가
    - `np.nanprod(arr[, axis=0|1])` : array 내 NaN 존재 시, 1로 간주하여 곱연산 반환
    - `np.cumprod(arr[, axis=0|1])` : array element간 누적 곱연산 반환
        ```python
        print("12. np.cumprod(axis=0): ", np.cumprod(c, axis=0)) # [[ 1 2][ 1*3 2*4] [1*3*5 2*4*6]]
        print("13. np.cumprod(axis=1): ", np.cumprod(c, axis=1)) # [[ 1 1*2] [3 3*4] [5 5*6]]
        ```
    - `np.sum(arr[, axis=0|1][, keepdims=True|False])` : array element간 합계 반환
        - `keepdims=Ture` 지정 시, 1 dim array로 합계 반환
        - `keepdims=False(default)` 지정 시, scalar로 합계 반환
        - array 내 NaN 존재 시 연산 불가
    - `np.nansum(arr[, axis=0|1])` : NaN을 0으로 간주하여 합계 반환
    - `np.cumsum(arr[, axis=0|1])` : array element간 누적 합계 반환
    - `np.mean(arr[,axis=0|1])` : array element간 평균 반환
    - `np.var(arr[, axis=0|1])` : array element간 분산 반환
    - `np.median(arr[, axis=0|1])` : array element간 중앙값 반환
        - array의 길이가 even number인 경우, 인접 2개 element의 평균 반환
    - `np.std(arr[, axis=0|1])` : array element간 표준편차 반환

    - `np.max(arr[, axis=0|1])` : array element간 최대값 반환
    - `np.min(arr[, axis=0|1])` : array element간 최소값 반환
    - `np.argmax(arr[, axis=0|1])` : array element간 최대값의 idx 반환
    - `np.argmin(arr[, axis=0|1])` : array element간 최소값의 idx 반환
    - `np.sort(arr[, axis=0|1])` : array element 정렬
        - `axis=None` : flatten 후 반환
        - `resverse` 미지원 : `np.sort(arr)[::-1]` 형식으로 출력
            ```python
            arr = np.array([[8, 2, 4], [100, 67, 33], [99, 44, 77]])
            # [[  8   2   4]
            #  [100  67  33]
            #  [ 99  44  77]]
            data4 = np.sort(arr, axis=0) # column 단위 sorting
            print(data4)
            # [[  8   2   4]
            #  [ 99  44  33]
            #  [100  67  77]]
            data4 = np.sort(arr, axis=1)  # row 단위 sorting
            print(data4)
            # [[  2   4   8]
            #  [ 33  67 100]
            #  [ 44  77  99]
            ```
        - Python sorting
            1. `sorted(object)`
                - __builtins__ object function
                - return sorted copy
            
            2. `object.sort(reverse=False)`
                - object function
                - `inplace=True`

    - `np.all(arr[, axis=0|1])` : array 내 모든 element가 True인지 boolean으로 반환
    - `np.any(arr[, axis=0|1])` : array 내 단 하나의 element라도 True인지 boolean으로 반환

    - `arr.transpose()` : transposition array 반환 = `arr.T`
    - `np.dot(arr, arr)` : array간 곱연산 반환 = `arr1 @ arr2`
        - 1 dim vector간의 곱연산은 합계 반환
        - 2 dim array : array간 곱연산 결과 반환
        ```python
        arr = np.arange(4).reshape(2,2)
        print(arr)
        '''
        [[0 1]
        [2 3]]
        '''
        print(np.dot(arr, arr))
        '''
        [[ 2  3]
        [ 6 11]]
        '''
        print(arr @ arr )
        '''
        [[ 2  3]
        [ 6 11]]
        '''
        arr = np.arange(4)
        print(np.dot(arr, arr)) # 0*0 + 1*1 + 2*2 + 3*3 = 14


## Reshaping dimensions
### Demension expansion
- `arr.reshape((row, col))` : 지정된 row, col array로 재배열
    - `(row, col)` 입력 시, tuple format에 유의
- `np.expand_dims(arr[, axis=0|1])` : array의 dim 확장
    - `axis=m` : m번째 dim idx 앞에 새로운 dim을 추가
        - `axis=0`: row dim 추가 (e.g., (3, 2) -> (1, 3, 2))
        - `axis=1`: col dim 추가 (e.g., (3, 2) -> (3, 1, 2))
        - `axis=-1`: array의 dim 추가 (e.g., (3, 2) -> (3, 2, 1))
        - `aixs=(n, m)` : n, m번째 위치에 dim 추가 ((e.g., axis(0, 2) : (3, 2) -> (1, 3, 2, 1)))
- `arr[np.newaxis]` : array의 dim 확장
    - `arr[np.newaxis, :]` : row dim 확장
    - `arr[np.newaxis]` : col dim 확장
    - `arr[:, np.newaxis]` : col dim 확장

### Dimension reduction
- `np.squeeze(arr[, axis=n])`
    - axis 미지정 시, size가 1인 dim을 모두 제거
    - `axis=m` : m번째 dim idx에 대해서만 size가 1인 dim을 제거 

### To one demension
- `arr.flatten()` : 1 dim으로 축소
    - `.copy()` : 원본에 영향이 없는 축소
- `arr.ravel()` : 1dim으로 축소
    - `.view()` : link 연결을 통한 원본 수정
