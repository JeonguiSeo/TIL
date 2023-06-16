# Pandas
## Pandas의 구조
- Series : 각 row & column
### Index
- Row index : 출력 및 수정 가능
- Column index : 미출력
### DataFrame 생성 :
- Read file : `read_*`
- Dict
    ```python
    df = pd.DataFrame({"col1": [4, 5, 6],
                   "col2": [7, 8, 9],
                   "col3": [10, 11, 12]})
   ```
- Nested list
    - ndarray 생성 지원
    ```python
    df = pd.DataFrame([[4, 7, 10], [5, 8, 11], [6, 9, 12]],
                  index=['a', 'b', 'c'],    # row label
                  columns=['col1', 'col2', 'col3'])     # col label
    ```             
- Series
    ``` python
    name =     pd.Series(["A", "B"])
    age =      pd.Series([11, 31])
    birthday = pd.Series(['1920/09/28', '1910/03/26'])

    h = pd.DataFrame([name, age, birthday])
    h.columns =["h1", "h2"]
    hero.index =["name", "age", "birthday"]
    print(hero)
    print(hero.T)
    ```
    - `series.T` : Transpose (Row, column 반전)
    - 단일 row, col을 통한 data 처리는 `series.function` 사용
    - 단, 여러 row | col 사용을 통한 data 처리는 `df.function` 사용

### Indexing
- `loc[ ]` : label 및 boolean을 통한 indexing
- `iloc[ ]` : idx를 통한 column indexing
### Visualizing
- 일부 시각화 기능 제공
- 단, 제한적 기능으로 인해 matplotlib 사용 권장
