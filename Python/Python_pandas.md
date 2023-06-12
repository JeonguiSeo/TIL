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
    df = pd.DataFrame({"col1" : [4 ,5, 6],
                   "col2" : [7, 8, 9],
                   "col3" : [10, 11, 12]})
   ```
- Nested list
    - ndarray를 통한 생성도 가능
    ```python
    df = pd.DataFrame([[4, 7, 10], [5, 8, 11], [6, 9, 12]],
                  index=['a', 'b', 'c'],
                  columns=['col1', 'col2', 'col3'])
    ```             
- Series
    - `series.T` : Transpose (Row, column 반전)
    ``` python
    name =     pd.Series(["유관순", "안중근"])
    age =      pd.Series([18, 31])
    birthday = pd.Series(['1920/09/28', '1910/03/26'])

    hero = pd.DataFrame([name,age,birthday])
    hero.columns =["hero1", "hero2"]
    hero.index =["이름", "나이", "생일"]
    print(hero)
    print(hero.T)
    ```

### Indexing
- `loc[ ]`
- `iloc[ ]`
### Visualizing
- 일부 시각화 기능 제공
- 단, 제한적 기능으로 인해 matplotlib 사용 권장
