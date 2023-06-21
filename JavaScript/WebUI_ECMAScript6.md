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
- 일반적으로 동등 비교인 경우에 사용
- `break` 지정은 선택 사항 (단, 사용 권장)
```javascript
switch(var){
    case conditional_value_1: statement_1; break;
    case conditional_value_2: statement_2; break;
    case conditional_value_3: statement_3; break;
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
## Node.js
- Chrome V8 JavaScript engine으로 build된 JavaScript runtime
