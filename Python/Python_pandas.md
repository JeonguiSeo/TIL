# Pandas
## Pandas의 구조
- Series : 각 row & column
- Row index : 출력 및 수정 가능
- Column index : 미출력

## Visualizing
- 일부 시각화 기능 제공
- 단, 제한적 기능으로 인해 matplotlib 사용 권장

## DataFrame 생성
### Dict
```python
df = pd.DataFrame({"col1": [4, 5, 6],
                "col2": [7, 8, 9],
                "col3": [10, 11, 12]})
```
### Nested list
- ndarray 생성 지원
- Nested list에 index, columns 지정
    ```python
    df = pd.DataFrame([[4, 7, 10], [5, 8, 11], [6, 9, 12]],
                    index=['a', 'b', 'c'],    # row label
                    columns=['col1', 'col2', 'col3'])     # col label
    ```             
### Series
- List를 `pd.Series`로 변환 후, `.columns`, `.index`를 통해 col, row label 지정
- 단일 Series는 `.to_frame(['name'])`을 통해 DataFrame으로 변경 가능
    - name 지정 시, col name을 대체
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


## Index/column 조회 및 변경
- Column name 조회
    - `df.columns`
    - `df.keys()`
- Column name 수정
    - `df.columns = ['value1', 'value2', ...]`
    
- Index(label) 조회
    - `df.index` 
- Index(label) 수정
    - `pd.DataFrame(..., index=['value1', 'value2', ...])`
    - `df.index = ['value1', 'value2', ...]`
- Value 조회
    - `df.values`
    - `df.to_numpy` (사용 권장)


### Index 관리
- `df.set_index(column, inplace=True|False)` : DataFrame의 기존 col을 idx로 변경
    - `inplace=True|False` : 원본 수정 여부 결정 (default : `inplace=False`)

- `df.reset_index(inplace=True|False, drop=True|False)` : 기존 idx reset
    - `inplace=True|False` : 원본 수정 여부 결정 (default : `inplace=False`)
    - `drop=True|False` : 기존 idx 삭제 여부 결정 (default : `drop=False`, 기존 idx를 col으로 추가)

- `df.reindex(index=index_labels)` : 기존 idx 삭제 후, idx 재할당
    ```python
    # str list룰 idx로 지정 시, element를 분할하여 할당
    new_df = df.reindex(index=list('ABCDE'))
    '''
        date   City  Temperature
    A  2021  Seoul           32
    B  2024  Seoul           34
    C  2023  Seoul           32
    D  2025  Seoul           53
    E  2022  Seoul           34
    '''
- `ignore_index=True` : DataFrame concat 시, idx 중복 reset
    - default : `ignore_index=False`
    - `new_df = pd.concat([df1, df2], ignore_index=True)`
        - `axis=0|1` : concat 방향 지정 가능


### Indexing
- `[ ]` : label 및 intger location 참조 가능
    - 단일 column은 Series로 반환
    - 다중 column은 DataFrame으로 반환
- 
- `loc[row_label, col_label]` : label 및 boolean을 통한 indexing
    - single, list, slice, boolean indexing 모두 적용 가능
        - `df.loc[label]` : indexing label, Series 반환
        - `df.loc[[label, label2, ....]]` : fancy label, DataFrame 반환
        - `df.loc[lable : label2]` : slicing label, DataFrame 반환 (label2 포함 반환)
        - `df.loc[[True, False, ..]]` : boolean indexing, DataFrame 반환  
- `iloc[row_idx, col_idx]` : idx를 통한 column indexing
    - int idx, boolean indexing 사용 가능
        - `df.iloc[idx]` : indexing 위치, Series 반환
        - `df.iloc[[idx1, idx2, ...]]` : fancy 위치, DataFrame 반환
        - `df.iloc[idx1 : idx2]` : slicing 위치, DataFrame 반환 (idx2 미포함 반환)
        - `df.iloc[[True, False, ..]]` : boolean indexing, DataFrame 반환  

## Add/Insert/Delete column
### Add column
- `df['colum_name'] = List
- `df['colum_name'] = Series
    ```python
    df["new_col"] = pd.Series(data=[10, 20, 30, 40], index=[1, 2, 3, 4])
    # 기존 DataFrame의 index가 지정되어 있는 경우, index param으로 명시 필요
    ```
- List comprehension
    ```python
    df["new_col"] = ["A" if i > 20 else "F" for i in df["col1"]]
    ```
- `df.assign(col_name=list)`
    - col_name에 quote를 사용하지 않음에 유의
    ```python
    new_df = df.assign(col_name=[10, 20, 30, 40])
    ```
- `df.assign(col_name = function, column_name2 = function2, ...)`
    - Callback 형태로의 function 지정
    ```python
    def total(x):
    return x["A"] + x["B"] + x["C"]

    new_df = new_df.assign(Total=total)
    ```
- `df.assign(col_name=lambda expression)`
    - lambda expression 사용 권장
    ```python
    new_df = new_df.assign(Total=lambda x: x["A"] + x["B"] + x["C"],
                            Total2=lambda x: x["A"] + x["B"] + x["C"])
    ```
- `pd.concat([df1, df2], axis=1, ignore_index=True|False)`
    - `ignore_index=True` : DataFrame concat 시, idx 중복 reset
        - default : `ignore_index=False`
    - `axis=0|1` : concat 방향 지정 가능 (default: `axis=0`)

### Insert column
- `df.insert(idx, "col_name", list)`
    - 지정된 idx col에 list 삽입


### Delete column
- 단일 column 삭제
    - `df.pop('column_name')`
    - `del df['column_name']`

- 다중 column 삭제
    - `df.drop(columns=list[, inplace=True])`
        - 지정된 list의 col 삭제
        - `inplace=True|False` : 원본 수정 여부 결정 (default : `inplace=False`)
    - `df.drop(list[, inplace=True][, axis=0|1)`
        - 특정 label을 가진 row/col 삭제
        - `axis=0|1` : list 내 element의 row/col label 명시 (default: `axis=0`)


## Add/Insert/Delete row
### Add row
- 단일 row 추가
    - `df._append(df2, ignore_index=True)`
    - pandas 1.3.0 ver. 이후 `.append` => `._append`로 대체
    
- 복수 row 추가
    - `new_df = pd.concat([df, df2, ...], axis=0 , ignore_index=True)`
    - list 내 단일 df 지정 가능
        - `ignore_index=True` : DataFrame concat 시, idx 중복 reset
            - default : `ignore_index=False`
        - `axis=0|1` : concat 방향 지정 가능 (default: `axis=0`)


### Delete row
- `df.drop(index=[idx1, idx2])`
    - inplace default : False
- `df.drop([idx1, idx2], axis=0)`
    - inplace default : False

## Loopup/Delete/Replace Null
### Null lookup
- Pandas function
    - `pd.isna(Scalar|Series|df)`
    - `pd.isnull(Scalar|Series|df)`
    - `pd.notnull(Scalar|Series|df)`
- DataFrame function
    - `df.isnull()`
    - `df['col_name'].isnull()`
    - `df[['col_name1', 'col_name2']].isnull()`


### Delete Null
- row 삭제
    - `df.dropna(axis=0|'index', inplace=False)`
    - `df.dropna(axis=0|'index', how="any|all" , inplace=False)`
        - default : `how="any"`, `inplace=False`
            - 'any' : If any NA values are present, drop that row or column.
            - 'all' : If all values are NA, drop that row or column.

- col 삭제
    - `ndf.dropna(axis=1|'column', inplace=False)`
    - `df.dropna(axis=1|'column', how="any|all" , inplace=False)`
        - default : `how="any"`, `inplace=False`
            - 'any' : If any NA values are present, drop that row or column.
            - 'all' : If all values are NA, drop that row or column.

### Replace Null
- `df.fillna(value, method='bfill|ffill|None', inplace=False, limit=n )`
    - `df.fillna(value)` : 전체 df의 Null을 value로 대체    
    - `df.fillna(method='bfill|ffill|None')` : Null 위치의 forward, next value로 대체
        - ffill: propagate last valid observation forward to next valid.
        - backfill / bfill: use next valid observation to fill gap


## Sorting
### Sorting value
- 단일 column sorting
    - `df.sort_values(by=col_name, ascending=True, inplace=False, ignore_index=False, kind="quicksort", na_position="last")`
- 다중 column sorting
    - `df.sort_values(by=[col_name, col_name2], ascending=True, inplace=False, ignore_index=False, kind="quicksort", na_position="last")`
        - `na_position="last"|"first"` : Null 처리 방식 지정 (as Max, as Min)
### Row/col index sorting
- Row 단위 label sorting
    - `df.sort_index(axis=0, ascending=True|False)`
- Col 단위 label sorting
    - `df.sort_index(axis=1, ascending=True|False)`


## Function
### DataFrame function
#### DataFrmae - Descriptive statistics function
- `axis=0` : vertical --> column 기준 반환 (default)
- `axis=1` : horizontal --> row 기준 반환

- `df.max(axis=0|1)` : 각 col/row의 최대값 반환
- `df.min(axis=0|1)` : 각 col/row의 최소값 반환
- `df.cummax(axis=0|1, skipna=True/False)` : 각 col/row의 누적 최대값 반환 (해당 col/row까지의 최대값)
    - `skipna=True/False` : NaN 발생 시, 이후 값을 NaN으로 반환 (default : `skipna=True`)
- `df.cummin(axis=0|1, skipna=True/False)` : 각 col/row의 누적 최소값 반환 (해당 col/row까지의 최소값)

- `df.idxmax(axis=0|1)` : 각 col/row의 최대값 idx label 반환
- `df.idxmin(axis=0|1)` : 각 col/row의 최소값 idx label 반환

- `df.sum(axis=0|1)` : 각 col/row의 합계 반환
- `df.cumsum(axis=0|1, skipna=True/False)` : 각 col/row의 누적 합계 반환
- `df.mean(axis=0|1, skipna=True/False)`: 각 col/row 평균 반환
- `df.median(axis=0|1, skipna=True/False)` : 각 col/row 평균 반환
- `df.prod(axis=0|1, skipna=True/False)` : 각 col/row 곱연산 반환
- `df.cumprod(axis=0|1, skipna=True/False)` : 각 col/row 누적 곱연산 반환
- `df.quantile(q=0.5, axis=0|1)` : 지정된 q quantile 만큼의 각 col/row quantile 반환
    - default : `q=0.5`
- `df.var(axis=0|1, skipna=True/False)` : 각 col/row 분산 반환
- `df.std(axis=0|1, skipna=True/False)` : 각 col/row 표준편차 반환
- `df.count(axis=0|1)` : NaN 제외 각 col/row data 개수 반환
- `df.describe()` : descriptive statistics 반환 (count, mean, std, min, quantile)


#### DataFrmae - Basic function
- `df.replace(old_value, new_value, inplace=True|False)` : DataFrame 내 old_value를 new_value로 치환
    - `df.replace({col1: old_value1, col2: old_value2, col3: [old_value3, old_value4]}, new_value)`
    - `df.replace({old_value1: new_value1, old_value2: new_value2})`
- `df.rename(columns|index={old_col: new_col})` : col_name, row_idx 변경
    - `df.rename(columns|index={old_col1: new_col1, old_col2: new_col2})`
    - `df.rename(mapper={old_col1: new_col1, old_col2: new_col2}, axis=0|1)`
        - `mapper` param을 통한 변경 시, `axis` 지정 필수 (default: `axis=None`)
- `df.apply(func, axis=0, raw=False, result_type=None)` : DataFrame에 임의의 function 적용
    임의의 함수를 한번에 DataFrame의 행과 열에 적용.
- `df.eval('expr:str', inplace=False)`: str 형태의 계산식 적용
    ```python
    df.eval('new_col = col1 * col2 - col3')
    ```
- `df.nunique(dropna=True)` : NaN을 제외한 unique element 수 반환
    - `dropna=False` : NaN을 element로 간주하여 unique element 수 반환
    - `Series.unique()`


##### DataFrmae - Boolean function        
- `df.all(axis=0|1, skipna=True|False)` : 각 col/row의 모든 value=True 여부 반환
    - 0, white_space -> False
    - `skipna=True/False` : NaN 존재 시, NaN 포함 axis 계산 제외 여부
        - `skipna=True` : NaN을 True로 연산
        - `skipna=False` : NaN 포함 axis 제외
- `df.any(axis=0|1, skipna=True|False)` : 각 col/row의 일부 value=True 여부 반환
- `df.duplicated()` : 각 col에 중복되는 row가 이미 존재하는 경우, True 반환
    - row1과 row2의 모든 elememt가 동일한 경우, row2부터 True 반환
    - `df.duplicate(subset=None, keep=first)`
        - `subset` : 특정 col 지정 가능
        - `keep` : 중복 확인 시작 지점 지정
            - `keep='first` : 위에서부터 row 확인
            - `keep='last` : 아래부터 row 확인
- `df.drop_duplicates()` : 모든 element가 중복되는 row를 제거
    - `df.drop_duplicates(subset=None, keep='first', inplace=False, ignore_index=False)`
        - `subset` : 중복 검사 조건이 될 특정 col 지정 가능
        - `keep` : 중복값 제거 후 남길 row 선택
            - `keep='first` : 첫 row 보존
            - `keep='last` : 마지막 row 보존
        - `ignore_index` : True인 경우 idx reset 
- `df.isin(values:Iterable|Series|DataFrame|Dict)` : 각 element의 values 일치 여부 반환
    - `df.isin({col_name: [value1, value2], {col_name1: [value3, value4]})`
- `df.between(left, right, inclusive=True, axis=0|1)` : 각 element의 범위 내 포함 여부 반환
    - `left` : 비교 범위의 시작 value (scalar, datetime)
    - `right` : 비교 범위의 끝 value (scalar, datetime)
    - `inclusive=True` : 비교 범위에 left, right value를 포함
    - `inclusive=False` : 비교 범위에 left, right value를 불포함


#### Series - String function
- `series.str.replace('old_str', 'new_str)` : series 내 old_str을 new_str으로 치환
- slice, indexing
    - `series.str[:]` : 모든 str 반환
    - `series.str[::-1]` : str 역순 반환
    - `series.str[1:]` : 각 str element를 idx 0부터 반환
    - `series.str[0]` : 각 str element의 idx 0 반환
- upper, lower
    - `series.str.upper()` : 각 str element의 uppercase 반환 
    - `series.str.lower()` : 각 str element의 lowercase 반환 

- Boolean idx
    - `series.str.contains(value)` : 각 str element의 value 포함 여부 반환
        - `series.str.contains('value1|value2')`
        ```python
        print(xxx.str.contains('a'))
        print(xxx[xxx.str.contains('a')])
        print(df['col_name'][df['col_name'].str.contains('a')])
        ```
    - `seires.str.startswith(value)` : 각 str element의 특정 문자 시작 여부 반환
    - `seires.str.endswith(value)` : 각 str element의 특정 문자 종료 여부 반환
    - `series.str.isupper()` : 각 str element의 uppercase 여부 반환
    - `series.str.islower()` : 각 str element의 lowercase 여부 반환

- one-hot incoding
    - `series.str.get_dummies()` : 각 str element의 dummy DataFrame 반환
    ```python
    series = pd.Series(['A', 'B', 'C'])
    print(series.str.get_dummies())
    '''
          A    B    C
    0     0    1    0
    1     0    0    1
    2     1    0    0
    '''
    ```

## Datetime data handling
- datetime간 연산 시, day 단위 반환
- `pd.to_datetime('date', format=None)` : str --> datetime 변환
    - str format의 `/`, `-`, ` `은 기본 인식 가능
    - 그 외 형식은 format 지정
    ```python
    pd.to_datetime('2023/6/15 12:24:45', format="%Y%m%d %H:%M:%S")
    ```
- `pd.date_range('start_date', 'end_date', periods=None, freq=None)` : 지정 범위 내 datetime 반환
    - `freq=None` : 반환 단위 설정 가능 (default : `"D"`)
        - `freq="M"` : Month 단위 반환
        - `freq="Y"` : Year 단위 반환
        - `freq="2Y"` : 2 year 단위 반환
    - `priods=None` : 반환 개수 지정 가능
        ```python
        pd.date_range("2023/1/1", periods=5, freq="M")
        ```
- DatetimeProperties
    - `df.dt.date` : Datetime -> YYYY-MM-DD(str)
    - `df.dt.year` : Datetime -> year(int)
    - `df.dt.month` : Datetime -> month(int)
    - `df.dt.month_name()` : Datetime -> month(str)
    - `df.dt.day` : Datetime -> day(int)
    - `df.dt.time` : Datetime -> HH:MM:SS(str)
    - `df.dt.hour` : Datetime -> hour(int)
    - `df.dt.minute` : Datetime -> minute(int)
    - `df.dt.second` : Datetime -> second(int)
    - `df.dt.quarter` : Datetime -> quarter(int)
    - `df.dt.weekday_name` : Datetime -> day name(str)
    - `df.dt.weekday` : Datetime -> day name(int) (0: Mon, 1: Wed)
    - `df.dt.weekofyear` : Datetime -> year 기준 Nth week(int)
    - `df.dt.dayofyear` : Datetime -> year 기준 Nth day(int)   
    - `df.dt.days_in_month` : Datetime -> Month 기준 Nth day(int)
    - `df.dt.is_leap_year` : Datetime -> True/False(윤년 여부)
    - `df.dt.is_month_start` : Datetime -> Month 시작일 여부
    - `df.dt.is_month_end` : Datetime -> Month 마지막일 여부
    - `df.dt.is_quarter_start` : Datetime -> 분기 시작일 여부
    - `df.dt.is_quarter_end` : Datetime -> 분기 마지막일 여부
    - `df.dt.is_year_start` : Datetime -> 연 시작일 여부
    - `df.dt.is_year_end` : Datetime -> 연 마지막일 여부

## Merge
- Common column
    - `new_df = pd.merge(df, df2,  how=“inner”  on=“common_col”, suffixes=None)`
        - `how` : merge 방식 지정 (default : `how="inner"`)
            - `"left"`, `"right"`, `"inner"`, `"outer"`, `"cross"`
        - `suffixes` : merge 대상 DataFrame간 중복되는 col_name에 붙일 접미사 지정 ()  
            - `suffixes=["_x", "_y"]`
    - `new_df = pd.merge(df, df2,  how=“inner”  on=[“common_col1”, “common_col2”])`
        - `on=list` : 복수의 common_col을 list로 지정하여 merge 가능 (sim. SQL composite identifier)
    - `new_df = pd.merge(df, df2,  how=“inner”  on=“common column”, indicator=True).query(expr).drop(columns=[col_1, ...])`
        - `indicator=True` : DataFrame에 `_merge` column을 생성하여 merge type 출력
            - `both`, `left_only`, `right_only`
        - `query(expr)` : str 형식의 conditional statement를 통해 True인 data 반환

- Uncommon column
    - `pd.merge(df, df2, how='inner', left_on="x1", right_on="y1")`
        - `left_on`, `right_on` : merge 조건에 해당하는 column을 지정
        - `left_on=df1.index`, `right_on=df2.index` : row index를 column으로 취급, merge 조건으로 지정
            - `left_index=True`, `right_index=True` : `df.index`가 아닌 True/False 지정을 통한 사용 가능
    - `pd.merge(df, df2, how='inner', left_on="x1", right_on="y1").query(expr).drop(columns=[col_name,.]).rename(columns={old_col_name: new_col_name})`


## Groupby
- Basic
    - `df.groupby("col_name1")["col_name2"].group_function`
        - df.groupby(by="col_name1")["col_name2"].group_function
            ```python
            df.groupby(by="col1")["col2"].sum()
            # 각 col1의 col2 합계 반환
            ```
- apply, agg, aggregate function
    - `df.groupby("col_name1")["col_name2"].agg(func_1, func_2,...)`
        - `agg` : 단일/다중 function 적용
    - `df.groupby("col_name").agg({"col_1": [group_func1, group_func2], "col_2": [group_func3, group_func4]})`
        - 각 column에 다양한 집계 적용 가능

## read_csv
- `pd.read_csv('file_path', index_col=None, header=None, names=None, usecols=None, nrows=None, sep=None)`
    - `index_col=n` : 특정 column을 row_idx로 변경
    - `header=0` : 1번째 row를 column name으로 지정
    - `names=list` : column name 지정
    - `usecols=list` : 특정 col 선택 반환 (단, 지정 순서가 아닌 파일 내 순서에 기반)
    - `nrows=n` : n개의 row만을 반환
    - `sep='str'` : 특정 str을 csv seperator로 지정
- `pd.to_csv('file_path')` : 지정 path에 DataFrame 저장