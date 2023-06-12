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
arr1D_1 = np.array([10, 20, 30])
arr1D_2 = np.array([5, 4, 3])

print(arr1D_1 + arr1D_2)
print(arr1D_1 - arr1D_2)
print(arr1D_1 * arr1D_2)
print(arr1D_1 / arr1D_2)
### vector + scalar (broadcasting 연산)
broadcasting : 서로 다른 차원을 가진 두 개의 값 산술 시, 연산이 가능하도록 차원을 자동 일치화
arr1D_1 = np.array([10,20,30])
print("4. numpy의 vector + scalar 연산 처리")
print(arr1D_1 + 2)  # [12 22 32]
print(arr1D_1 - 2)  # [ 8 18 28]
print(arr1D_1 * 2)  # [20 40 60]
print(arr1D_1 / 2)  # [ 5. 10. 15.]
### 비교 연산의 vectorizing
boolean 색인 적용 가능
print(arr1D_1 % 3 == 0)
print(arr1D_1 > 15)
print((arr1D_1 > 15) & (arr1D_1 % 6 == 0))
### Vector 생성
#### np.array(list)
- list로 ndarray 생성 시, dtype은 기존 list의 값으로 자동 지정
    - int의 기본 dtype : int32 (4bytes)
    - float의 기본 dtype : float64 (8bytes)
- np.array 시, ndarray class로 변환
    - list type의 경우 print 시, element간 ',' 확인 가능
    - 반면 ndarray는 print 시, element간 ',' 확인 불가
# 1 dimensional array
list_value = [10, 20, 30]
vector1 = np.array(list_value)
print(list_value, type(list_value))     # [10, 20, 30] <class 'list'>
print(vector1, type(vector1), vector1.dtype)    # [10 20 30] <class 'numpy.ndarray'> int32
#### Upcasting : Int와 flaot dtype을 함께 변환하는 경우, 보다 큰 범주의 dtype인 float으로 변환
list_value = [10., 20, 30]      # float, int, int
vector1 = np.array(list_value)
print(vector1, type(vector1), vector1.dtype)    # int -> float
#### 명시적 dtype 변경
> def array(p_object: ndarray | Iterable | int | float,<br>
            dtype: object | None = None,<br>
            *args: Any,<br>
            **kwargs: Any) -> ndarray
list_value = [10., 20, 30]      # float, int, int
vector1 = np.array(list_value, dtype=np.int32)
print(vector1, type(vector1), vector1.dtype)    # float -> int
##### np.array 속성
- 차원(dimension,axis) 개수 : ndim
- 차원의 크기(shape) : shape
- 총 element 개수 (size) : size
- 저장 데이터 type(dtype) : dtype
print(vector1.ndim)
print(vector1.shape)
print(vector1.size)
print(vector1.dtype)
#### Randon function
    np.random.random([n]) : 0.0 <= 값 < 1.0 사이의 임의의 float 값 반환, 갯수 생략 시 1 개 반환
    np.random.rand([n]) :  0 ~ 1의 균등분포에서 표본 추출, 갯수 생략하면 1 개 반환
    np.random.randn([n]) :  표준편차가 1이고 평균값이 0인 정규분포에서 표본 추출. 갯수 생략 시  1개반환
    np.random.randint(Min, Max, Num) : 주어진 최소(inclusive) ~ 최대(exclusive) 범위안에서 임의의 정수 n개 반환
    np.random.randint(최대범위, size=n개) :   0 ~ 최대(exclusive) 범위안에서 임의의 정수 n개 반환
        
    np.random.choice(리스트)  : 주어진 리스트에서 임의의 값 1개 반환
    np.random.shuffle(리스트)  :  주어진 리스트를 shuffle 함.  in-pacle(True)로 동작됨.
