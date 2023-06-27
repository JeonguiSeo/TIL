# ECMAScript6
- JavaScript 표준화를 위해 만들어진, Script programming language (ECMAScript2015)
- Node.js와 같은 비 browser 환경에서도 사용 가능
- Body/Head tag 내의 `<script></script>` 영역에서 사용
    - Internal : `<script></script>`
    - External : `<script src=path_to_js.js></script>`
- Indent가 실행에 영향을 미치지 않음
- Annotation
    ```javascript
    //statement

    /*
    statement1
    statement2
    */
    ```
- User defined Identifier
    - 첫 문자는 반드시 alphabet, _, $로 지정
    - Upper/lowercase 구분


## Data type
- `var`, `let`을 통한 variable 선언
    - `var`
        - Variable 중복 선언 가능
        - Function level scope : function 내부/외부 선언 여부에 따라 local/global variable 결정
            - function 내에서 선언된 variable은 function 내에서만 유효
            - Hoisting 가능 : function 내에 존재하는 모든 variable을 최상단에서 선언
    - `let` 
        - Variable 중복 선언 불가
        - Block level scpoe : code block 내부에서 선언한 variable은 모두 local variable
            - code block(function, if, for, while, try/catch statement) 내에서 선언된 variable은 variable 내에서만 유효
            - Hosting 불가
    - `const`
        - Constant variable 선언
        - Value 변경 불가 외에는 `let` variable과 동일 기능
- 저장되는 data type에 따라 variable type 결정
- Declaration과 definition을 2 step으로 진행
    ```javascript
    var variable_name;
    variable_name = value
    
    var variable_name = value;
    ``` 
- Primitive Data Type (PDT) : 
    - number : int/float을 구분하지 않음
    - spring, escape letter : double/single quotation 모두 사용 가능하나, double quotation 사용 권장
    - boolean : true/false (lowercase)
    - undefined : undefined variable
    - null : no object
    - infinite
    - NaN : Not a Number
- Reference Data Type (RDT)
    - Array : `[value1, value2,... ]`
    - JSON(object) : `{key: value}`
    - Function : `function( ){ }` (indent가 아닌 `{ }`을 통해 적용)
    - Class
- `typeof` : data type 반환
    ```javascript
    console.log(typeof NaN); // number
    ```

## Operator
### Arithmetic operator
- `+`, `-`, `*`, `/`, `%`
### Concatenation operator
- string type과 number 사이의 `+` 연산은 concat으로 처리
### Assignment operator
- `+=`, `-=`, `*=`, `/=`, `//`
### Comparison operator
- Boolean 반환 : `==`, `>`, `>=`, `<=`, `<`, `!=`
- Equal : `==`
    - Compare value only
- Identical : `===`
    - Compare value and type
- undefined 비교 시에는 반드시 identical operator 사용
```javascript
var x;
console.log(x === undefined)	// true
console.log(x == undefined)	// true (단, x = null인 경우에도 true 반환)

var x = null;
console.log(x === undefined)	// false
console.log(x == undefined)	// true
```
### Logical operator
- OR operator : `||`
- AND operator : `&&`
- Not opereator : `!`
- False 처리 value
    - `0`
    - `""`
    - `null`
    - `undefined`
    - `NaN`
- Object operation
    - `value1 || value2` : value1이 true이면 value1 반환, false이면 value2 반환
    - `value1 && value2` : value1이 true이면 value2 반환, false이면 value 2반환
        ```javascript
        console.log(10 || "Hello");	// 10
        console.log("" || "Hello");	// Hello

        console.log(10 && "wolrd");	// world
        console.log(null && "wolrd")	// null
        ```
### Increment and decrement operator
- 피연산자에 1씩 증가/감소 시 사용
- Increment operator : `++`
    - `var x = ++n` (prefix): n을 우선 증가시킨 후, x variable에 할당
    - `var x = n++` (postfix): n을 x variable에 우선 할당 후, n 증가
- Decrement operator : `--`
    - `var x = ++n` (prefix) : n을 우선 감소시킨 후, x variable에 할당
    - `var x = n++` (postfix) : n을 x variable에 우선 할당 후, n 감소
```javascript
var n = 10;
var x = ++n;
console.log(n, x);	// 11 11

var n = 10;
var x = n++;
console.log(n, x);	// 11 10
```
### Ternary operator
- `variable = (conditional statement) ? true_value : false_value`
- Nesting 가능
```javascript
var x = (4>3) ? ((true) ? 100 : 200) : "B";
console.log(x)  // 100
```
### Spread operator
- 지정된 array를 speard하는 방식으로 동작
- `...[array]|JSON`
```javascript
var n = [10, 20, 30];
// 1) copy array
var n2 = [...n];
console.log(n, n2)  // [10, 20, 30] [10, 20, 30]

// 2) Insert an array into another array
var x = [1, 2, 3]
var n2 = [...n, ...x]
console.log(n2)     // [10, 20, 30, 1, 2, 3]

// 3) value insert
var x = [1, 2, 3];
var n2 = [...x, 1000, 2000]
console.log(n2);    // [1, 2, 3 ,1000, 2000]

// 4) string spread
var n2 = [..."Hello"];
console.log(n2);   // ["H", "E", "L", "L", "O"]
```

## Function
- `console.log(value)` : console에 value 출력
- `alert(value)` : view port에 alert 출력
- `prompt(value)` : view port에 value와 함께 string 입력창 출력
- `Number.parseInt(var)` : string을 number로 변환 (window object method)
    - `perseInt(var)`와 동일하나, `Number.parseInt(var)` 사용 권장
        - `perseInt(var)`는 주어진 string의 기본 진법에 따라 결정
            -  "0x"/"0X"로 시작하는 경우, 16진법으로 해석
            - "0"으로 시작하는 경우 8진법으로 해석


## Control statement
### If statement
```javascript
if(conditional_statement){
    statement_1;
    statement_2;
}
```

### If ~ else statement
```javascript
if(conditional_statement){
    statement_1;
} else {
    statement_2;
}
```

### Multiple If ~ else statement
```javascript
if(conditional_statement_1){
    statement_1;
} else if(conditional_statement_2) {
    statement_2;
} else if(conditional_statement_3) {
    statement_3;
} else {
    statement_4;
}
```

### Switch statement
- 일반적으로 동등 비교인 경우에 사용 (`var === value`)
- `break` 지정은 선택 사항 (단, 사용 권장)
```javascript
switch(var){
    case value_1: statement_1; break;
    case value_2: statement_2; break;
    case value_3: statement_3; break;
    default: statement_4; break;
}
```

### While statement
```javascript
start_value;

while(conditional_statement){
    Stetement;
    Increment/Decrement_operator;
}
```

### Do ~ while statement
- Conditional statement가 일치하지 않더라도 반드시 한번은 문장을 실행
- 반복 횟수가 예측 불가능한 경우 사용
```javascript
do{
    statement;
    Increment/Decrement_operator;
} while(conditional_statement)
```

### For loop statment
- 복수의 start value 및 Increment/decrement statement 사용 시 `,`로 구분
- 복수의 conditional statement는 `&&`, 
```javascript
for(start_value; conditional_statement; Increment/Decrement_statement){
    statement_1
    statement_2
}
```
```javascript
for(var n1 = 10, n2 = 1; n > 5 && n2 <3 ; n += 2, n2++){
    console.log("Loop", n);
}
```
- Nesting 가능
    ```javascript
    for(start_value_1; conditional_statement_1; Increment/Decrement_statement_1){
        statment_1;
        for(start_value_2; conditional_statement_2; Increment/Decrement_statement_2){
            statement_2;
        }
    }
    ```
    ```javascript
    for(var n = 1; n <= 5; n++){
        for(let m = 0; m < 2; m++) {
            console.log("D");
        }
    }
    ```
### Break, Continue
- `break` : 특정 조건 만족 시, 위치한 loop에서 이탈
    ```javascript
    if(conditional_statement) break;
    ```
- `continue` : 특정 조건 만족 시, 위치한 loop 내에서 이하의 statement를 skip
    ```javascript
        if(conditional_statement) break;
    ```


## Object : Define Class
- 모든 data object는 `property`/`method`로 사용 가능
    - `property(var)` : attribute
    - `method(func)` : operator
- [w3schools.com](https://www.w3schools.com/jsref/jsref_obj_string.asp)에서 methods 확인 가능 

### Data object
- 사용 시, 반드시 명시적 생성 필요
- `Number` : number object 생성
    ```javascript
    /* 1.
    let n = new Number(100);
    let n = 100;
    */
    let n = new Number(10);
    let n2 = 10;

    let m = new Number(3.1357);
    let m2 = 3.1357;

    // 2. Object의 property, method 확인
    console.dir(m)
    // log : value 출력 
    // dir : object의 세부 내용 출력

    // 3. Object의 property, method 사용
    console.log(Number.MAX_VALUE);
    console.log(Number.MIN_VALUE);

    // string -> number
    console.log(Number.parseInt("10") + 10);
    console.log(Number.parseInt("hello")); // NaN

    // string -> float
    console.log(Number.parseFloat("3.15") + 10);

    // int -> float
    let num = 5.56789;
    console.log(num.toFixed()); // 6
    console.log(num.toFixed());  // 5.57

    // NaN 여부 boolean 반환
    console.log(Number.isNaN(123));     // false
    console.log(Number.isNaN("123"));   // false
    console.log(Number.isNaN(NaN));     // true
    console.log(Number.isNaN(""));     // false - "" == false !== NaN

    // int 여부 boolean 반환
    console.log(Number.isInteger(123)); // true
    console.log(Number.isInteger("123"));   // false
    console.log(Number.isInteger("Hello")); // false
    ```
- `String` : string object 생성
    ```Javascript
    /* 1. 
    let str = new String("hello");
    let str = "hello"; (사용 권장) 
    */
    let s = "hello";
    let s2 = new String ("hello");

    // 2. Object의 property, method 확인
    console.dir(s2);

    // 3. Object의 property, method 사용
    console.log(s2.length); // 문자의 길이 반환
    console.log(s2.charAt(0)); // 특정 위치의 문자 반환
    console.log(s2.concat("!!")); // 특정 문자와 병합
    console.log(s2.indexOf("h")); // 특정 문자의 위치 반환 
    console.log(s2.indexOf("x")); // 존재하지 않는 문자는 -1 반환
    console.log(s2.toLowerCase()); // Lowercase 반환 
    console.log(s2.toUpperCase()); // Uppercase 반환 
    console.log(s2.substring(0, 3)); // substring(start, end) 문자열의 start~(end-1)까지 반환
    console.log(s2.substr(0, 3)); // substr(start, len)  문자열의 start부터 len개 반환
    console.log(s.replace("h","H")); // replace(old, new)

    let x = "     world     ";
    console.log(s.trim());
    console.log(s.trim().toUpperCase());    // method chain 가능        

    let x2 = "AAA/BBB/CCC";
    let x2_arr = x2.split("/");   // split("separator")
    console.log(x2_arr);

    console.log(x2.includes("A"));  // true - boolean 반환
    console.log(x2.includes("A", 6));  // false includes("string", position)

    console.log(x2.startsWith("A"))     // true
    console.log(x2.endsWith("C"))   // true
    ```
- `Date` : date object 생성
    ```javascript
    /* 1.
    let d = new Date();
        */
    let d = new Date();
    console.log(d); // current date 출력

    // 2. Object의 property, method 확인
    console.dir(d)

    // 3. Object의 property, method 사용
    console.log(d.getFullYear());
    console.log(d.getMonth() + 1);   // 반드시 + 1과 함께 사용
    console.log(d.getDate());

    console.log(d.getHours());
    console.log(d.getMinutes());
    console.log(d.getSeconds());

    // 특정 날짜 설정
    let d2 = new Date();

    d2.setFullYear(2033);
    d2.setMonth(1);  // Jan = 0
    d2.setDate(1);

    console.log(d2);  // Tue Feb 01 2033 13:20:28 GMT+0900 (GMT+09:00)
    ```
- `Boolean` : boolean object 생성
    ```javascript
    console.log(new Boolean(0).toString(), new Boolean(0).valueOf);    // false
    console.log(new Boolean(""));    // false
    console.log(new Boolean(null));    // false
    console.log(new Boolean(undefined));    // false
    console.log(new Boolean(NaN));    // false

    // 이외의 값은 true로 처리
    console.log(new Boolean(10));   // true
    console.log(new Boolean("aa")); // true


    // toString() vs valueOf() ==> valueOf 사용 권장
    var x = new Boolean(0);

    var k = x.toString();   // toString() : boolean을 string으로 반환
    var k2 = x.valueOf();   // valueOf() : boolean object 반환

    console.log(k);
    if(!k){
        console.log("false")    // string -> True
    }

    console.log(k2);
    if(!k2){
        console.log("false2")
    }
    ```
- `Array` : array object 생성
    ```javascript
    // 1.
    /*
    let arr = new Array(10, 20 ,30);
    let arr2 = [10, 20, 30]; // general way
    let arr3 = []; // empty array
    */
    let arr = new Array(10, 20 ,30);
    let arr2 = [10, 20, 30] 
    let arr3 = []

    // 2. Object의 property, method 확인
    console.dir(arr);
    
    // 3. Array 조회
    console.log(arr[0], arr[1]);

    for(var i = 0; i < arr2.length; i++){
        console.log(arr2[i]);
    }

    // for ~ of statement : array value 저장
    for(let x of arr){
        console.log(x);
    }

    // for ~ in statement : array index 저장
    for(let x of arr){
        console.log(arr2[x]);
    }
    ```
    ```javascript
    /* 1.
    let arr = new Array(10, 20 ,30);
    let arr2 = [10, 20, 30]; // general way
    let arr3 = []; // empty array
    */

    let arr = new Array(10, 20 ,30);
    let arr2 = [10, 20, 30] 
    let arr3 = []

    // 2. Object의 property, method 확인
    console.dir(arr);
    
    // 3. Array 조회
    console.log(arr[0], arr[1]);

    for(var i = 0; i < arr2.length; i++){
        console.log(">>", arr2[i]);
    }

    // for of statement : array value 저장
    for(let x of arr){
        console.log("##", x);
    }

    // for in statement : array index 저장
    for(let x of arr){
        console.log("@@", arr2[x]);
    }
    ```
    ```javascript
    let x =[4, 5, 6, 1, 2, 3, 9, 7];
    
    //1. revesre (in-place)
    console.log(x.reverse()); //  [7, 9, 3, 2, 1, 6, 5, 4]
    console.log(x);
    
    //2. slicing
    console.log(x.slice(0, 4)); // 0~ 3 [7, 9, 3, 2]
    
    //3. index 반환
    console.log(x.indexOf(2)); // 3

    //4. sorting 
    console.log(x.sort()); // [1, 2, 3, 4, 5, 6, 7, 9]

    // string과 같이 취급하여 sorting되기에, 2자리 이상의 수는 function 적용 필요
    let x2 =[14, 25, 6, 11, 2, 3, 93, 7];
    console.log(x2.sort(function(n,n2){
        return n - n2;  // ascending
    }));

    console.log(x2.sort(function(n,n2){
        return n2 - n;  // descending
    }));

    // join ==> seperator를 기준으로 concatenate
    const fruits = ["Banana", "Orange", "Apple", "Mango"];
    let text = fruits.join(" ");
    console.log(text);
    ```

### BOM : Browser Object Model
- Browser 시작 시, 자동 생성되는 object
- `Window` : window of the browser
    - `var window = new Window();`
    - Global object로서 최상위 역할 수행
        - `window.`를 생략하고 property, method 사용 가능
            ```javascript
            alert()
            prompt()
            parseInt()

            // Window object의 property
            navigator
            screen
            location
            history
            document
            ```
- `Screen` : width/height of the window
    - `var screen = new Screen();`
        ```javascript
        console.log(screen, window.screen);

        console.log(screen.height); // 1440
        console.log(screen.width);  // 2560
        ```
- `Navigator` : browser information
    - `var navigator = new Navigator();`
        ```javascript
        console.log(navigator, window.navigator);

        console.log(navigator.userAgent); // userAgenet attribute - PC/Mobile browser 여부 확인
        // Windows NT 10.0; Win64; x64

        console.log(navigator.onLine);  // true
        ```
- `History` : browser URL history
    - `var history = new History();`
        ```javascript
        console.log(window.history, history);
        ```
- `Location` : URL
    - `var Location = new location();`
        ```javascript
        console.log(location, window.location);

        console.log(location.hostname); // 127.0.0.1
        console.log(location.host);  // 127.0.0.1:5500
        console.log(location.port);  // 5500

        console.log(location.href);  // http://127.0.0.1:5500/...path.../file_name.html
        // JavaScript를 통한 외부 링크 제공 가능

        // Function
        function google_go(){
            location.href="http://www.google.com"
        };
        ```

### DOM : Document Object Model
- DOM tree를 통해 node에 접근하여 변경/수정/삭제/추가 수행
- 모든 DOM은 `property`/`method`로 사용 가능
    - `Document` : Browser에서 HTML open 시 자동 생성

### User defined object
- Data 관리 목적으로 생성
    - `{Key: Value}` : JSON (JavaScript Object Notation)
    - User defined class 

## JS function
- Parameter와 argument의 개수 미일치 시에도 error 미반환
- Rest paramenter(`...`) 사용 시, 내부적으로 array 관리
    ```javascript
    var fun = function(...n){     // rest parameter
        console.log(n);
    };

    fun(10);   // [10]
    fun(1, 2, 3);  // [1, 2, 3, 5, 7]
    fun(1, 2, 3, 5, 7); // [1, 2, 3, 5, 7]
    ```
- Default parameter 사용 가능
    ```javascript
        function fun(n1=1, n2=2, ...n3){    // default parameter + rest parameter
        console.log(n1, n2, n3);
    }
    fun(10);   // 10, 2
    fun(1, 2, 3);  //  1, 2, [3]
    fun(1, 2, 3, 5, 7) // 1, 2, [3, 5, 7]
    ```

### Function experssion
- Unnamed function : variable에 function을 저장
- Variable name을 통한 호출 가능
```javascript
var var_name = function(var, ...){
    statement;
}

var_name()
```

### Function declaration
- Named function : 지정된 parameter를 갖는 function을 정의
```javascript
function func_name(var, ...){
    statement;
}
```

### Arrow function
- Python의 lambda와 유사한 구현 가능
    ``` javascript
    var fun = (n) => {
        console.log(n);
    };

    fun(10); 
    

    var fun = n => {    // 단일 parameter는 ( ) 적용 없이도 인식 가능
    console.log(n);
    };

    fun(10);

    // return 지정
    var fun = (n, n2) => {
        console.log(n, n2);
        return n + n2;
    }

    // 단일 return은 { } 없이 인식 가능
    var fun = (n, n2) => n + n2;

    ```

## Event
### Event
- User-generated event
    - Button click, mouse over, drag, etc.
    - Keyborad input
- System-generated event : Web browser의 HTML docs 기반 DOM tree 완성 시 발생 (onload)
    - `<body>` tag 내에서 사용
        ```javascript
        <button onclick="func_name"></buttom>
        ```
    - DOM tree 생성 시, tag에 해당하는 object 제공
#### Object path
- Document object 이용
- Document vaiable 이용
    - `property`
    - `method` : DOM tree의 특정 node 접근 가능
        - ID를 통한 접근 : `docuemnt.getElementByID("id_value")`
        - CSS selector를 통한 접근 :
            - "CSS_selector 사용 시, selector 형식 입력에 주의 (`.` - Class, `#` - ID, etc.)
            - `document.querySelector("CSS_selector")` : 1개의 node에 접근
            - `document.querySelectorAll("CSS_selector")` : n개의 node에 접근
        ```html
        <script>

            function k (){
                var p = document.getElementById("x");   // p tag object
                console.dir(p);
                console.log(p.innerHTML);   // <span>Hello</span>
                console.log(p.innerText);   // Hello

                var p = document.getElementById("x").innerText; // string, method chain
                console.log(p); // Hello

                ////////////////////////////////////
                var x = document.querySelector("#x")    // ID selector

                var x = document.querySelector(".y")    // Class selector

                var x = document.querySelectorAll("p"); // Nodelist(array) 반환
                console.log(x, x[1], x[0].innerText, x[1].innerText);
                // [p#x, p.y], <p class="y">world</p>, 'Hello', 'world'
            }
            // head tag 내에서 body tag에 접근하기 위해서는 function/onload 사용 필수  

            function value_change(){
                var x = document.querySelector(".y");
                x.innerText="New world";
                // document.querySelector(".y").innerHTML = "New world"
                document.querySelector(".y").innerHTML = "<h1>New world</h1>"
            }

        </script>
        </head>
        <body onload="k()">

            <p id="x"><span>Hello</span></p>
            <p class="y">world</p>
            <button onclick="value_change()">Change value</button>

        </body>
        ```

### Event source
- Event가 발생하는 tag (e.g., `<button></button>`)

### Event type
- Click, double click, mouse over, etc.

### Event handler
- Web page 내 발생하는 여러 event를 대응 처리하는 function에 연결하는 역할 수행
- Event source의 tag 내에 설정하여 사용
    - 단, `onsubmit`은 `<form>` tag 내에 설정
- `onclick`, `onmouseover`, `onmouseover`, `onmouseout`, `onkeyup`
```javascript
<button onclick = "func_name()">Text</button>
```

#### DOM Level 0
- Inline event model, classic event model에 해당
    - Inline event model : tag 내에 지정하여 사용
    - Traditional event model : function 내에 지정하여 사용

#### DOM Level 2
- W3C(standard) event model에 해당

### Event object
- Event 발생 시, 자동 생성되어 event handler가 호출하는 function에 전달
- `event` variable를 통해 사용
    ```javascript
    function fun() {
        console.log("Event object:", event);
    }
    ```
- Event method
    - `event.preventDefault()`; : submit, a href, action과 같은 무조건적 action 기능을 방지
        - 즉, event가 발생한 요소의 기본 동작을 방지
    - `event.stopPropagation()`; : Event 전파 방지
        - 계층 구조에서 상위 node에 event가 전파되지 않도록 설정
    ```html
    <head>
    <script>

        function fun() {
            console.log("fun")
            console.log("Event object:", event);
        }
        
        function fun2() {
            event.preventDefault();
        }
    </script>
    </head>
    <body>
        <button onclick="fun()">OK</button>
        <form action="target.html" onsubmit="fun2()"> <!--onsubmit은 form tag에 지정-->
            Name <input type="text" name="username"><br>
            Age <input type="text" name="age"><br>
            <input type="submit" value="submit">
        </form>
        <div style="background-color: aqua;" onclick="a()">
            a
            <div style="background-color: blueviolet;" onclick="b()">
                <!--기본적으로 b를 click 시, 상위 node인 a까지 동작하나, stopPropagation()을 통해 전파 방지-->
            b
            </div>
        </div>
    </body>
    ```
## Ajax
- Asynchronous Javascript and XML : 비동기 방식의 web 통신
    - Synchronization : Browser-server간의 request-search-response가 순서대로 발생
        - Server 응답 완료 전까지 browser 대기
        - 작업 순서가 보장되나 성능이 저하되는 단점 존재
        - 응답 시 HTML document 전체를 반환하여 reload
    - Asynchronization : Browser-server간의 request-search-response를 대기 없이 진행
        - Server 응답 완료 전에도 browser 작업 가능
        - 작업 순서는 보장되지 않으나, 성능 향상
        - 응답 시 XML, JSON data를 반환하여 window의 일부를 변경
    - XMLHttpRequset object
        - [reqres.in](https://reqres.in)에서 JSON 반환 실습 가능
            - JSON viewer plugin install 권장
    - JSON object - string 변경 method
        - `JSON.stringify()` : JavasScript object -> JSON string
        - `JSON.parse()` : JSON string -> JavaScript object
    ```HTML
    <head>
        <script>
        
            var httpRequest;    // Global variable로 사용하기 위해 function block 외부에서 선언
            function req(){
                // Object 생성
                httpRequest = new XMLHttpRequest();

                console.dir(httpRequest);

                // Response 처리를 위한 callback function 호출 event handler 등록
                httpRequest.onreadystatechange = responseFun;
                
                // URL info 및 추가 info 설정
                httpRequest.open("get", "https://reqres.in/api/users/2");

                // Request
                httpRequest.send(null); // get 방식인 경우 null 지정
            }   
            
            function responseFun(){
                if(httpRequest.readyState==4 && httpRequest.status==200){
                    var data = httpRequest.responseText;
                    console.log(data, typeof data);

                    var jsonData = JSON.parse(data);
                    console.log(jsonData, typeof jsonData);

                    var id = jsonData.data.id;
                    var email = jsonData.data.email;
                    var first_name = jsonData.data.first_name;
                    var last_name = jsonData.data.last_name;
                    var avatar = jsonData.data.avatar;
                    console.log(id, email, first_name, last_name, avatar);

                    var table = `<table>
                                    <tr>
                                        <th>id</th>
                                        <th>email</th>
                                        <th>first_name</th>
                                        <th>last_name/th>
                                        <th>avatar</th>
                                    </tr>
                                    <tr>
                                        <td>${id}</td>
                                        <td>${email}</td>
                                        <td>${first_name}</td>
                                        <td>${last_name}</td>
                                        <td><img src="${avatar}" width="100" height="100"></td>
                                    </tr>
                                </table>`
                    document.querySelector("#result").innerHTML=table;
                }
            }
        </script>
    </head>
    <body>
        <button onclick="req()">reqres.in</button>
        <div id="result"></div>
    </body>
    ```

## Destructuring
### Array destructuring
```javascript
        var [a, b, c] = [10, 20 ,30];
        console.log(a, b, c);   // 10 20 30

        var [a, b, c] = [10, 20];
        console.log(a, b, c);   // 10 20 undefined

        var [a, b, c=1] = [10, 20];
        console.log(a, b, c);   // 10 20 1

        var [a, b, ...c] = [10, 20, 30, 40, 50, 60];
        console.log(a, b, c);   // 10 20 [30, 40, 50, 60]
```

### JSON destructuring
- Key 출력 시, 각 value 반환
    ```javascript
    var {a, b} = {a: 100, b: 200};
    console.log(a, b);  // 100 200
    ```

## Template literals
- String 작성 시, `" "`, `' '`, `` ` ` `` 사용 가능
    - 단, row 변경 시 작업 용이성 및 출력 형태 유지를 위해 backtick(`` ` ` ``) 사용 권장
        ```javascript
        var x = "A";

        var n = "<table> \
                    <tr> \
                        <td>"+x+"</td> \
                    </tr> \
                    </table>";
        console.log(n);
        /*

        <table>                     <tr>                         <td>A</td>                     </tr>                     </table>

        */

        var x = "A";
        var n = `<table>
                    <tr>
                        <td>${x}</td>
                    </tr>
                    </table>`;
        console.log(n);

        /*

        <table>
                    <tr>
                        <td>A</td>
                    </tr>
                    </table>

        */


        ```


## Node.js
- Chrome V8 JavaScript engine으로 build된 JavaScript runtime
