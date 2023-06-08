# Markdown Cheat Sheet

## Markdown
### Text quote
`> text`
> plain text format의 markup language



## Heading
* Heading은 `h1` ~ `h6` tag로 표현

------------------------------
# A first-level heading
`# A first-level heading`
## A second-level heading
`## A first-level heading`
### A third-level heading
`### A first-level heading`
------------------------------

## List
List는 `ul` or `ol` tag로 표현
### Unordered list
`*` or `-`
* A
* B
* C
### Oldered list
`1`, `2`, `3`
1. A
2. B
3. C

## Fenced Code Block
```
언어를 지정하지 않고 표현
```

### python language 지정
` ``` python ``` `

``` python
# 주석
print('hello')
```

### HTML language 지정
` ``` html ``` `
```html
<!-- 주석-->
# 파이썬 주석
<h1>Markdown<h1/>
```


## Link
### Web link 삽입
`- [Google](https://google.com)`
- [Google](https://google.com)
### Local file link 삽입
`- [Python](./python.md)`
- [Python](./python.md)
#### Indentation
    - `.`: 현재 directory(folder)
    - `..`: 상위 directory
    - local file 연결 가능


## Image 삽입
`![image](./Mojave%20Night.jpg)`
![image](./Image/Mojave%20Night.jpg)


## Table
<pre>
```
|이름|나이|
|--|--|
|홍길동|100|
|김철수|50|
```
</pre>

|이름|나이|
|--|--|
|홍길동|100|
|김철수|50|


# Text style
*기울임* **굵게** ~~취소선~~
___
text

|Style|Syntax|Command|Example|Print|
|------|------|------|------|------|
|굵게|`** **` or `Ctrl+B`|`**This is bold text**`|**굵게 표시된 텍스트**|
|기울임꼴|`* *` or `_ _`|`Ctrl+I`|`*This text is italicized*`|*기울임꼴로 표시된 텍스트*|
|취소선|`~~ ~~`|없음|`~~This was mistaken text~~`|~~실수하여 취소된 텍스트~~|
|굵게 및 중첩된 기울임꼴|`** **` and `_ _`|없음|`**This text is _extremely_ important**`|**매우 _중요한_ 텍스트**|
|모든 굵게 및 기울임꼴|`*** ***`|없음|`***All this text is important***`|***이 모든 텍스트가 중요합니다.***|
|아래 첨자|`<sub> </sub>`|없음|`<sub>This is a subscript text</sub>`|<sub>아래 첨자 텍스트입니다.</sub>
|위 첨자|`<sup> </sup>`|없음|`<sup>This is a superscript text</sup>`|<sup>위 첨자 텍스트입니다.</sup>|
