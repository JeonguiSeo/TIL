# Class in Python

## Class

```python
    class class_name:
        statement

    # 객체 생성을 통해 사용
        variable = class_name():

            def __init__(self):
                self.variable_name = n  # instance variable : 데이터 저장
            # 객체 생성자 호출 => class_name( )
            # 생성자는 객체 생성 시 자동 호출되는 함수
            # 생성자의 역할: 객체 생성 시, instance의 초기 상태를 설정 및 필요 속성 초기화

    # method : 일반적인 기능 처리 담당 (function in class)
    def method_name(self):
        pass

```




# 애완동물 관리 프로그램 개발 구축
```Python
class Cat:
    def __init__(self, name, age):
        # __init__ : 생성자(class 선언 시 실행)
        # __init__이 아닌 함수는 class_variable.function을 통해 실행 필요
        # self는 parameter로 인식하지 않으나 필수 요소
        print("__init__생성자", id(self))
        self.username = name   # class 내에 instance 변수 생성 - self.~~
        self.age = age

c = Cat("야옹이", 2)
print(id(c))   # 1554292933328
print(c.username, c.age)

c2 = Cat("나비", 1)
print(c2.username, c2.age)


class Cat:

    def __init__(self, n, a):
        self.username = n
        self.age = a

    # method
    def set_age(self):
        self.age = n
    def get_age(self):
        return self.age

# 실제 고양이(instance)
c = Cat("야옹이", 2)
print(c.username, c.age)
print(c.username, c.get_age())

c2 = Cat("나비", 1)
print(c2.username, c2.age)
print(c2.username, c2.get_age())
```