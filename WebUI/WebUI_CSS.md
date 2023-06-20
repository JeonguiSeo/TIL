# CSS : Cascading style sheets
- Parent node에서 지정된 설정을 child node에서 재정의 가능
- Grammar 
    - Property
        - Color, position, font 등의 style 지정
        ```css
        Selector{ 
            Property_1: value1;
            Property_2: value2;
        }
    - Annotation : `/*~*/`
    - Inline/internal/external style
        ```html
        <link rel="stylesheet" type="text/css" href="css/external.css">
        <style>
        .internal{
            color: red;
        }
        </style>
        </head>
        <body>
        <p>Hello</p>
        <!-- inline style : 사용 지양-->
        <p style="color:blue;">inline Style</p>
        <!-- internal style-->
        <p class="internal">internal style</p>
        <!-- external style : use xternal file-->
        <p id="external">external style</p>
        ```

## Selector
- Java script 호환 가능
- All selector
    - `*` : HTML page 내부의 모든 tag 선택
    ```html
    <style type="text/css">
        *{
        color:red;
        }
    </style>
    ```

- Tag selector
    - 특정 html tag 선택
    - 다중 tag 지정 시 `,` 사용
    ```html
    <style type="text/css">
        h1, span{
        color:red;
        }
        p{
        color:blue;
        }
    </style>
    </head>
    <body>
        <h1>h1 tag style</h1>
        <p>p tag style</p>
        <span>span tag style</span>
    </body>
    ```

- ID selector
    - 특정 id attribute를 가진 tag 선택 (중복 불가)
    - `#id`
        ```html
        <style type="text/css">
        #one {
            color: red;
        }
        #two {
            color: blue;
        }
        </style>
        </head>
        <body>
            <div id="one">
                <h1>text1</h1>
                <p>text2</p>
                <h2>text3</h2>
            </div>
            <div id="two">
                <h1>text4</h1>
                <p>text5</p>
                <h2>text6</h2>
            </div>
        </body>
        ```

- Class selector
    - 특정 class attribute를 가진 tag 선택 (중복 가능)
    - `.`을 통한 class 지정
    ```html
    <style type="text/css">
    .select {
        color: red;
    }
    </style>
    </head>
    <body>
    <ul>
        <li class="select">red_text1</li>
        <li>text</li>
        <!-- class 내 중복 value 지정 가능-->
        <li class="select xyz">red_text2</li>
        <li>text</li>
    </ul>	
    </body>
    ```
- Descent selector
    - 특정 tag의 decendent element 선택
    - `parent_selector decendent selector`
    - `id=one` node 이하의 모든 `h1` tag 선택
        ```html
        <style type="text/css">
        #one  h1 {
            color: red;
        }
        </style>
        </head>
        <body>
            <div id="one">
                <h1>text1</h1>
                <p>text2</p>
            <div>
                <h1>text3</h1>
            </div>
            </div>
        ```
- Child selector
    - 특정 tag의 child node 선택
    - parent node > child node
    - `id=one` node의 `h1` tag 선택
    ```html
    <style type="text/css">
    #one > h1 {
        color: red;
    }
    </style>
    </head>
    <body>
        <div id="one">
            <h1>Hello</h1>
            <p>Hello2</p>
        <div>
            <h1>world</h1>
        </div>
        </div>
    </body>

- Sibling selector
    - 인접한 Sibling element 선택
        - `selector_A + selector_B` : selector_A 바로 뒤에 위치한 selector_B 선택
        ```html
        <style type="text/css">
        h1 + h2 {
            color: red;
        }
        </style>
        </head>
        <body>
            <h1>red text1</h1>
            <h2>red text2</h2>
            <h3>text</h3>
            <h2>text</h2>
            <h2>text</h2>
        </body>
        ```
        - `selector_A ~ selector_B` : selector_A 뒤에 위치하는 모든 selector_B 선택
        ```html
        <style type="text/css">
        h1 ~ h2 {
            color: red;
        }
        </style>
        </head>
        <body>
            <h1>red text1</h1>
            <h2>red text2</h2>
            <h3>text1</h3>
            <h2>red text3</h2>
            <h2>red text4</h2>
        </body>
        ```


- Attribute selector 
    - 특정 attribute를 가진 element 선택
        - `[attribute]` : 특정 attribute를 가진 tag 선택
        - `tag[attribute]` : tag 내 특정 attribute를 가진 tag 선택
            ```html
            <style type="text/css">
            [id]{
            color:red;
            }

            a[id]{
                background-color: blue;
            }
            </style>
            </head>
            <body>
                <h1 id="one">red text1</h1>
                <h2>text</h2>
                <h3 id="two">red text2</h3>
                <h2>text</h2>
                <h2>text</h2>
                <a href="#" id="link">blue backgroud text</a>
            </body>
            ```
    - `[attribute=a]` : tag 내 특정 attribute=value인 tag 선택
        ```html
        <style type="text/css">
        [id="two"]{
        color:red;
        }
        </style>
        </head>
        <body>
            <h1 id="one">text</h1>
            <h2>text</h2>
            <h3 id="two">red text</h3>
            <h2>text</h2>
            <h2>text</h2>
        </body>
        ```
    - `tag[attribute^="value"]` : 특정 value로 시작하는 tag 선택
    - `tag[attribute$="value"]` : 특정 value로 끝나는 tag 선택 
    - `tag[attribute*="value"]` : 특정 value를 포함하는 tag 선택

### Pseudo selector
- `:selector` 형식의 selector
- HTML element의 특정 state 명시
    - `:link`, `:visited`, `:hover`, `:active` : a tag 사용 시, state에 따른 selector
        ```html
        <style>
        a:link {color:red;}    /* unvisited link */
        a:visited {color:green;} /* visited link */
        a:hover {color:yellow;}   /* mouse over link */
        a:active {color:blue;}  /* selected link */

        input:focus { 
            background-color:lightblue
        }

        </style>
        ```
    - `:focus` : widonw에서 focus된 input 요소 선택
        ```html
        <style>
        input:focus { 
            background-color:lightblue
        }
        </style>
        ```
    - `:first-child` : tag의 parent node를 기준으로, 첫 child node tag 선택
        ```html
        <style type="text/css">
        p:first-child {
            color:red;
        }

        </style>
        </head>
        <body>
            <p>red text</p>
            <p>text</p>
        <div>
            <p>red text(first child of div node) </p>
        </div>
        </body>
        ```
    - `:last-child` : tag의 parent node를 기준으로, 마지막 child node tag 선택
        ```html
        <style type="text/css">
        p:last-child {
            color:red;
        }
        </style>
        </head>
        <body>
            <p>text</p>
            <p>text</p>
        <div>
            <p>red text</p>
        </div>
    - `:only-child` : 유일한 child node로 구성된 모든 tag 선택
        ```html
        <style type="text/css">
        p:only-child{
            color:red;
        }
        </style>

        </head>
        <body>
        <div>
            <p>red text</p>
        </div>
        <div>
            <p>text</p>
            <p>text</p>
        </div>
        <div>
            <div>
            <p>red text</p>
            </div>
        </div>
        </body>
   
    - `:nth=child(n)` : 지정된 tag의 parent node를 기준으로 일치하는 n번째 child 선택
        - `n` : int, formula, `even`, `odd` 지정 가능
        ```html
        <style type="text/css">
        p:nth-child(2n-1){
            color:red;
        }
        </style>
        </head>
        <body>
            <p>red text1</p>
            <p>text</p>
            <p>red text2</p>
            <p>text</p>
            <p>red text3</p>
            <p>text</p>
            <p>red text4</p>
        </body>
        ```
    - `:not` : selector에 해당되지 않는 모든 tag 선택
        ```html
        <style type="text/css">
        p:not(p:nth-child(even)){
            color:red;
        }
        </style>
        </head>
        <body>
        <p>red text1</p>
        <p>text</p>
        <p>red text2</p>
        <p>text</p>
        <p>red text3</p>
        <p>text</p>
        <p>red text4</p>
        </body>
        ```

    - `:disabled`, `:enabled` : 활성화 여부에 따른 tag 선택
        ```html
        <style type="text/css">
        input:disabled {
            background: green;
        }
        input:enabled {
            background: yellow;
        }
        </style>
        </head>
        <body>
            <input type="text" disabled="disabled" />
            <input type="text" />
        </body>
        ```
    
    - `:checked` : checked가 적용된 form element 선택
        ```html
        <style type="text/css">
        input:checked{
            height: 50px;
            width: 50px;
        }
        </style>
        </head>
        <body>
            checked_1<input type="checkbox" checked="checked" />
            text<input type="checkbox" />
            checked_2<input type="checkbox" checked="checked" />
        </body>

    - `:empty` : tag 내 body가 없는 항목 선택
        ```html
        <style type="text/css">
        p:empty{
            width: 100px;
            height: 20px;
            background: #ff0000;
        }
        </style>
        </head>
        <body>
        <p></p> <!--applied here-->
        <p>text</p>
        <p>text</p>
        </body>

### Units
- Absolute lenghts

|***Unit***|***Description***|
|---|---|
|cm|centimeters|
|mm|millimeters|
|in|inches (1in = 96px = 2.54cm)|
|px *|pixels (1px = 1/96th of 1in)|
|pt|points (1pt = 1/72 of 1in)|
|pc|picas (1pc = 12 pt)|


- Relative lengths (default : 16px)
    - 1rem = 16px
    - `em` : 중첩 시, 문제 발생
        - `rem` 사용 권장
|***Unit***|***Description***|
|---|---|
|em|Relative to the font-size of the element (2em means 2 times the size of the current font)|
|ex|Relative to the x-height of the current font (rarely used)|
|ch|Relative to the width of the "0" (zero)|
|rem|Relative to font-size of the root element|
|vw|Relative to 1% of the width of the viewport*|	
|vh|Relative to 1% of the height of the viewport*|	
|vmin|Relative to 1% of viewport's* smaller dimension|	
|vmax|Relative to 1% of viewport's* larger dimension|
|%|Relative to the parent element|

```html
<style type="text/css">
   #_16px{
    font-size: 16px;
   }
   #one{
    font-size: 100%;
   }
    #two{
    font-size: 200%;
   }
   #three1{
    font-size: 1em;
   }
   #three2{
    font-size: 1rem;
   }
   #four{
    font-size: 2em;
   }
   #five{
    font-size: 32px;
   }
</style>
```

```html
<style type="text/css">
   html{
     font-size: 10px
   }
   #a li{
      font-size: 1.5em;
    }
    #b li{
      font-size: 1.5rem;
    }
</style>
```

### Color
- Alphabetical use
    - 120여 가지 색상 제공
    - `red`, `black`, `blue`, `gray`, `green`, `yellow`, etc.
- 6bit, 3bit usage
    - 6bit : #RRGGBB
    - 3bit : #RGB
- Decimal number usage :
    - RGBA value 사용 가능
        - A : alpha를 통한 투명도 조정 가능
```html
<style type="text/css">
   #one{
    color:red 
   }
    #two{
     color:#00ff00;
   }
   #three{
    color:rgb(0,0,255);
   }
   #four{
    color:rgba(0,0,255,0.3);
   }
</style>
```

### Display attribute
- Tag의 영역 표시 방식 지정
    - `display:none` : Tag를 view port에서 보이지 않게 지정
        - `display:none` 지정 시, 영역 유지 불가
    - `display:block` : Tag를 block 형식으로 지정
        - Inline level -> Block level 
    - `display:inline` : Tag를 inline 형식으로 지정
        - Block level -> Inline level
    - `display:inline-block` : Tag를 inline-block 형식으로 지정
        - inline 형식으로 배치되나, block처럼 width, height 적용 가능
    
    ```html
    <style type="text/css">
    p{
        display:inline;
    }
    </style>
    ```

### Visibility attribute
- Element의 visibility 지정
    - `display:visible` : Tag가 view port에서 보이도록 지정
    - `display:hidden` : Tag가 view port에서 보이지 않도록 지정
        - `display:none`과 달리, 영역 유지
    - `display:collapse` : table tag가 view port에서 보이지 않도록 지정
        - 단, 영역 유지 불가

### Opacity attribute
- Element의 투명도를 지정
    - 0~1 사이의 숫자로 지정
    ```html
    <style type="text/css">
    #box{
        opacity:0.2;
    }
    </style>
    ```

### Box model
![image](image/Box_Model.png)
```html
<style type="text/css">
div {
    width: 300px;
    border: 15px solid green;
    padding: 50px;
    margin: 20px;
}
</style>
```
- Content : The content of the box, where text and images appear (width, height)
    - Height 미지정 시, 보유한 content만큼 height 할당
        - 단, width는 full width 할당   
- Padding : Clears an area around the content. The padding is transparent
    - Padding 지정 방식

        - Up, left, down, right
        - Up & down, left & right
        - Up, right & right, left

    ```html
    <style type="text/css">
    div{
        width:100px;
        height: 100px;
        background-color: red;
        margin:10px; 
        border: 10px solid black;
    }
    #one{
        padding-top:10px;
        padding-right:10px;
        padding-bottom:10px;
        padding-left:10px;
        }
        #two{
        padding:10px 10px 10px 10px;  /* up right down left */
        }
        #three{
        padding:10px; 
        }
        #four{
        padding:50px 20px;  /* up & down: 50px  left & right: 20 px*/
        }
        #five{
        padding:50px 20px 30px;  /* up: 50px  left & right: 20 px  down: 30px */
        }
    </style>
    ```
    ```html
    <style type="text/css">
    div{
        width:100px;
        height: 100px;
        background-color: red;
        margin:10px; 
        border: 10px solid black;
    }
    #one{
        padding-top:10px;
        padding-right:10px;
        padding-bottom:10px;
        padding-left:10px;
        }
        #two{
        padding:10px 10px 10px 10px;  /* up right down left */
        }
        #three{
        padding:10px; 
        }
        #four{
        padding:50px 20px;  /* up & down: 50px  left & right: 20 px*/
        }
        #five{
        padding:50px 20px 30px;  /* up: 50px  left & right: 20 px  down:30px */
        }
    </style>
    ```
- Border : A border that goes around the padding and content
    - Border 지정 방식
        - width, style, color 순으로 지정 가능
            - `border-width` : width 지정 (up, down 지정 가능)
            - `border-style` : border style 지정
            - `border-color` : border color 지정
                ```html
                <style type="text/css">
                div{
                    width:100px;
                    height: 100px;
                    background-color: red;
                    margin:10px;
                }
                #one{
                    border-top-width: 10px;
                    border-right-width: 10px;
                    border-bottom-width: 10px;
                    border-left-width: 10px;
                    
                    border-top-style: solid;
                    border-right-style: solid;
                    border-bottom-style: solid;
                    border-left-style: solid;
                    
                    border-color: black;
                
                    }
                    #two{
                    border-width: 10px 20px;
                    border-style: solid dotted;
                    border-color: black;
                    }
                    #three{
                    border-width: 10px;
                    border-style: solid;
                    border-color: black; 
                    }
                    #four{
                    border: 10px solid black;
                    }

                </style>
                ```

            - `border-ridius` : Box corner를 둥글게 설정
                ```html
                <style>
                .grad {
                    width:300px;
                    padding:10px;
                    border:8px solid #F00;
                    
                    border-radius: 20px;
                }
                </style>
                ```
            - `box-sizing: border-box` : 여러 개의 block box에 width, height를 동일하게 설정한 후 border-box 지정 시, 상이한 padding/border일지라도 동일한 결과의 box size 생성 
            ```html
            <style type="text/css">
            #one {
                width: 300px;
                height: 100px;
                border: 1px solid blue; 
                box-sizing: border-box;
                
            }

            #two {
                width: 300px;
                height: 100px;
                padding: 50px;
                border: 1px solid red;
                box-sizing: border-box;
                
            } 
            </style>
            ```

- Margin : Clears an area outside the border. The margin is transparent
    - Margin 지정 방식
        - width, stype, color 순으로 지정 가능
        - Up, right, down, left
        - Up & down, left & right
        - Up, left & right, down
            ```html
            <style type="text/css">
            div{
                width:100px;
                height: 100px;
                background-color: red;
            }
            #one{
                margin-top:10px;
                margin-right:10px;
                margin-bottom:10px;
                margin-left:10px;
                }
                #two{
                margin:10px 10px 10px 10px;  /* up right down left */
                }
                #three{
                margin:10px; 
                }
                #four{
                margin:10px 20px;  /* up & down: 10px  left & right: 20 px*/
                }
                #five{
                margin:10px 20px 30px;  /* up: 10px  left & right: 20 px down:30px */
                }
            </style>
            ```
    - `Margin: auto` 지정 시, content box를 centered 배치




### Backgroud attribute
|Value|Description|
|---|---|
|background-color|Specifies the background color to be used
|background-image|Specifies ONE or MORE background images to be used|
|background-position|Specifies the position of the background images|
|background-size|Specifies the size of the background images|
|background-repeat|Specifies how to repeat the background images|
|background-origin|Specifies the positioning area of the background images|
|background-clip|Specifies the painting area of the background images|
|background-attachment|Specifies whether the background images are fixed or scrolls with the rest of the page|
|initial|Sets this property to its default value.|
|inherit|Inherits this property from its parent element.|

```html
<style type="text/css">
    body{
      background-image:url('images/001.png');
      background-repeat: no-repeat;  /* OR repeat */
      background-attachment: scroll; /* OR fixed */
      background-position: bottom;
      background-color: powderblue;
      /*
        cover: image가 전체 container를 채우도록 크기 조정
        certain: image가 완전히 보이도록 크기 조정
      */
      background-size: cover;
    }
</style>
```

### Font attribute
`font: font-style font-weight font-size font-family`
- 복수의 font attribute를 지정하는 것이 일반적
    - 상위 font attribute에 generic family font 지정
- Generic family
    - Web browser에서 기본으로 제공 (serif, monospace, etc.)
- Font family
    - 구체적인 font family를 의미

- `font-family`
```html
<style type="text/css">
     /*  C:\Windows\Fonts  */
     .font-arial{
       font-family: '없는 폰트' , sans-serif;
     }
     .font-roman{
       font-family:  '없는 폰트' ,  serif;
     }
     .font-ansang{
       font-family: '굵은안상수체' , sans-serif;
     }
     .font-md{
       font-family: 'MD솔체' , sans-serif;
     }
</style>
```
- `font-size`
```html
<style type="text/css">
   
   .a{
      font-size: xx-small;
    }
    .b{
      font-size: x-small;
    }
    .c{
      font-size: small;
    }
    .d{
      font-size: medium;
    } 
    .e{
      font-size: large;
    }
    .f{
      font-size: x-large;
    }
    .g{
      font-size: xx-large;
    }
</style>
```
```html
<style type="text/css">
   
   .a{
      font-size: 2rem;
    }
    .b{
      font-size: 32px;
    }
    .c{
      font-size: 2.5em; /* 40px=16*2.5em */
    }
    .d{
       font-size: 1.875em; /* 30px=16*1.875em */
    }
    .e{
       font-size: 0.875em; /* 14px=16*0.875em */
    }
</style>
```
- `font-weight`
```html
<style type="text/css">
   p{
      font-style: italic;
      font-weight: bold;  /* 100 ~ 900 사이의 값 지정도 가능 */
      font-size: 2em;
    }
</style>
```

#### Font-face (web font)
- Web document 내에 font 정보를 함께 저장한 후, client system으로 다운로드하여 사용하는 기법
```html
<style>
@font-face {
	font-family:cheri;
	src:url('fonts/cheri.ttf') format('truetype');
}
.text1{
	font-family:cheri, Arial Black;
	font-size:80px;
	color: #006;

} 
</style>
```

#### Text attribute
- `color` : text 색상 지정
- `text-align` : text 수평 정렬 지정
- `text-decoration` : text 밑줄 지정 및 해제
- `text-transfrom` : text upper/lowercase 지정
- `text-indent` : 첫 line indent 지정
- `letter-spacing` : text 간격 지정
- `word-spacing` : word 간격 지정
- `line-height` : line 간격 지정

### Position attribute
- Tag의 위치 설정 변경 시 사용
- `top`, `left`, `right`, `bottom` attribute와 함께 사용
    - `static` : default, normal position
        - position value 적용 불가
        ```html
        <style type="text/css">
        div.static {
            position: static;  /* 기본 */
            border: 3px solid #73AD21;
        }
        </style>
        ```
    - `relative` : normal position을 기준으로 상대적 위치 결정
        ```html
        <style type="text/css">
        div.relative {
            position: relative;
            top:30px;  
            left:50px;
            border: 3px solid #73AD21;
        }
        </style>
    - `absolute` : parent node를 기준으로 상대적 위치 결정
        <ol type="1">
        <li>Parent node에 height attribute 지정</li>
        <li>Parent node에 relative position 설정</li>
        <li>Child node에 absolute position 설정</li>
        </ol>

        ```html
        <style type="text/css">
        div.relative {
            position: relative;
            width: 400px;
            height: 200px;
            border: 3px solid #73AD21;
        } 

        div.absolute {
            position: absolute;
            top: 80px;
            right: 0;
            width: 200px;
            height: 100px;
            border: 3px solid #73AD21;
        } 
        </style>
        ```
    - `fixed` : browser view port 기준 위치 고정
        ```html
        <style type="text/css">
        div.fixed {
            position: fixed;
            bottom: 0;
            right: 0;
            width: 300px;
            border: 3px solid #73AD21;
        }
        </style>
        ```

### Z-index attribute
- View port에서의 nested element가 stack되는 순서를 설정
    - 큰 값을 입력할수록 상위에 제시
    ```html
    <style type="text/css">
    img {
        position: absolute;
        left: 0px;
        top: 0px;   
        z-index: -1;
    }
    </style>
    ```

### Float attribute
- 각 element간의 배치를 지정
- Flaoted element는 unfloated element 위에 배치
    - `left` : container 좌측 정렬
    - `right` : continer 우측 정렬
    - `none` : default, float 미지정
    ```html
    <style>
    img {
    float: right;
    }
    </style>
    ```

### Flex box
- Float 및 positioning 없이 row/col 지정을 통한 1차원 layout 적용
- CSS `display: flex` 지정 필수
    ```html
    <style type="text/css">
        .container{
                display:flex;
                background-color: powderblue;
                width: 200px;
        }
        .item{
            background-color: tomato;
            color:white;
            border:1px solid white;
        }
    </style>
- Flex module 적용을 위해 parent-child relation 설정 필요 (nesting 가능)
    - Flex contatiner와 flex item에 적용 가능한 속성 상이
    - Parent node : Flex container
        - `flex-direction` : 배치 방향을 지정
            ```html
            <style type="text/css">
                .container{
                    display:flex
                    flex-direction: row; /* default */ 
                    /* flex-direction: row-reverse; */
                    /* flex-direction: column; */
                    /* flex-direction: column-reverse; */
                }
            </style>
            ```
        - `flex-warp` : Flex item 크기 유지 및 overflow가 contatiner의 여러 row에 펼쳐지도록 지정
            - 기본적으로 flex item은 하나의 row에 맞추기 위해 자체적으로 축소
            ``` html
            <style type="text/css">
                .container{
                    display:flex
                    flex-wrap: nowrap; /* default */
                    /* flex-wrap: wrap; */
                    /* flex-wrap: wrap-reverse; */
                }
            </style>
            ``` 
        - `flex-flow` : `flex-direction`과 `flex-wrap` attribute를 모두 설정하기 위한 단축 표현
            - `flex-flow: flex-direction flex-wrap`
            - 둘 중 하나의 attribute만을 지정한 경우, 나머지 attribute는 default value 적용
            ```html
            <style type="text/css">
                .container{
                    display:flex;
                    /* 
                    flex-direction: row;
                    flex-wrap: wrap; 
                    */
                    flex-flow: row wrap;
                }
            </style>
            ```
        - `justyfy-content` : main axis에 대한 정렬 지정 (default : row)
            - View port width 변경 시, flexbox의 자동 계산을 통한 정렬 유지
            ```html
            <style type="text/css">
                .container{
                    display:flex;
                    flex-direction: row; /* OR column */
                    
                    justify-content: flex-start;
                }
            </style>
            ```
        - `align-items` : cross axis에 대한 정렬 지정
            - default : stretch
            ```html
            <style type="text/css">
                .container{
                    align-items: stretch;
                }
            </style>
            ```
        - `align-content` : `flex-wrap: wrap`인 경우에만 적용 가능
            - Cross axis에 정렬되는 방식 지정
            ```html
            <style type="text/css">
                .container{
                    flex-wrap: wrap;
                    align-content: center;
                }
            </style>
            ```

    - Child node : Flex item
        - `order` : default 0을 기준으로 order attribute를 이용한 item 정렬
            - order value가 작을수록 먼저 표시
            ```html
            <style type="text/css">
                .item{
                    order: 0
                }
            </style>
            ```
            ```html
            <style type="text/css">
                .container{
                    display:flex;
                    flex-direction: row;

                }
            </style>
            </head>
            <body>
                <div class="container">
                    <div class="item" style="order: 3">1</div>
                    <div class="item" style="order: 2">2</div>
                    <div class="item" style="order: 4">3</div>
                    <div class="item" style="order: 1">4</div>
                    <div class="item" style="order: -1">5</div>
                    <div class="item" style="order: 0">6</div>
                </div>
            </body>
            ```

        - `flex-basis` : flex item의 초기 길이 지정
            - 미지정 시, content 및 지정 width로 설정
            - `flex-basis`와 width 동시 지정 시, `flex-basis` 적용
                - 단, `flex-basis: auto` 지정 시, width 적용
                - `max-width`, `min-width` 지정 시, `flex-basis` 무효화
            ```html
            <style type="text/css">
                .container{
                        display:flex;
                        flex-direction: row;
                }
                .item{
                    color:white;
                    border: 1px solid black;
                }
                .item:nth-child(2){
                    flex-basis: auto;
                }
                .item:nth-child(3){
                    flex-basis: auto;
                    width: 150px;
                }
                .item:nth-child(4){
                    flex-basis: 250px;
                }
            </style>
            ```
        - `flex-grouw` : 특정 element가 주어진 비율에 따라 flex container에서 확장되도록 지정
            - Default : `flex-grow: 0`
            - `flex-grow: n` : 타 flex item보다 n배 더 많은 비율을 할당
            ```html
            <style type="text/css">
                .container{
                    background-color: powderblue;
                    
                    display:flex;
                    flex-direction: row;
                }
                .item{
                    background-color: tomato;
                    color:white;
                    border: 1px solid black;
                    flex-grow: 1;
                }
                .item:nth-child(3){
                    flex-grow: 3;
                }
            </style>
            ```
        - `flex-shrink` : 특정 element가 주어진 비율에 따라 flex container에서 축소되도록 지정
            - Default : `flex-shrink: 1`
            - `flex-shrink: 0` : 축소 미적용

        - `flex` : `flex-grow`, `flex-shrink`, `flex-basis` attribute를 모두 설정하기 위한 단축 표현 
            - `flex: <flex-grow> <flex-shrink> <flex-basis>`
                - 특정 attribute만을 지정 시, 타 attribute는 default 적용
            ```html
            <style type="text/css">
                .container{
                        background-color: powderblue;
                        
                        display:flex;
                        flex-direction: row;
                }
                .item{
                    background-color: black;
                    flex: 0 0 200px; 
                }
            </style>
            ```
        - `align-self` : cross axis을 기준으로 flex item의 정렬 방법 지정
            - 독립적인 사용을 위해 지정
            - `align-items` attribute보다 우선하여 적용
            ```html
            <style type="text/css">
                .item:nth-child(2){
                    background-color: black;
                    align-self: flex-end; 
                }
            </style>
            ```
### Media query
- `@media` 규칙 적용을 통한 media 서식 지정
- View port의 width, heigth를 활용하여 responsive app 구현 가능
    ```css
    /* max-width = 600px이 되면, lightblue 및 width 50%로 변경 */
    @media  screen and (max-width: 600px) { 
        body {
            background-color: lightblue;
            width: 50%;
        }
    }
    ```
    |***Value***|***Description***|
    |---|---|
    |all|Used for all media type devices|
    |print|Used for printers|
    |screen|Used for computer screens, tablets, smart-phonesm etc.|
    |speech|Used for screenreaders that "reads" the page out loud|