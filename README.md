# RadishCalculator
내배캠 1주차 과제
### 필수 구현기능(Lv1~Lv3)

lv1

  더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스를 만들기
  생성한 클래스를 이용하여 연산을 진행하고 출력
  오류가 날 수 있는 ‘예외처리’ 상황에 대해 고민해보기

lv2

  Lv1에서 만든 Calculator 클래스에 “나머지 연산”이 가능하도록 코드를 추가하고, 연산 진행 후 출력
  오류가 날 수 있는 ‘예외처리’ 상황에 대해 고민해보기 + 구현하기
Lv3

  아래 각각의 클래스들을 만들고 클래스간의 관계를 고려하여 Calculator 클래스와 관계 맺기
    AddOperation(더하기)
    SubtractOperation(빼기)
    MultiplyOperation(곱하기)
    DivideOperation(나누기)
    Calculator 클래스의 내부코드를 변경
    관계를 맺은 후 필요하다면 별도로 만든 연산 클래스의 인스턴스를 Calculator 내부에서 사용
  Lv2 와 비교하여 어떠한 점이 개선 되었는지 스스로 생각해 봅니다.
    - hint. 클래스의 책임(단일책임원칙)

Lv4

  AbstractOperation라는 **추상화된** 프로토콜 만들기
  기존에 구현한 AddOperation(더하기), SubtractOperation(빼기), MultiplyOperation(곱하기), DivideOperation(나누기) 클래스들과 관계를 맺고 Calculator 클래스의 내부 코드를 변경
  스위프트의 어떤 문법을 이용하여 추상화할 수 있을지 생각해 봅시다
  Lv3 와 비교해서 어떠한 점이 개선 되었는지 스스로 생각해 봅니다.
    hint. 클래스간의 결합도, 의존성(의존성역전원칙)

진행 경과
lv3과 lv4에 존재하는 힌트를 바탕으로 SOLID라는 객체지향 프로그래밍의 5가지 원칙에 대해 처음으로 알게 되었고
class를 이용해 코드를 짜고 전체적인 구조를 짜야 하기에 원칙 공부가 우선되야 한다고 판단함
추가로 이번 과제의 목표는 객체지향에 대한 이해와 객체 간의 유기적인 구조를 짤 줄 아는 능력을 기르는 것이라고 생각하게 됨
  > https://velog.io/@bom_daddy/SOLID

첫 구조로 Calculator와 Operator로 나누어 기능을 분리.
Calculatro에서는 피연산자와 결과값을 저장하고 Operator에서는 연산을 담당.
Operate라는 메서드를 정의한 프로토콜을 만들어 준수하게 만듬.
입력받은 연산자에 따른 연산 객체를 생성하는 문제를 해결하기 위해 팩토리 패턴을 알게 되어 적용함.
팩토리 패턴을 적용할 때 오로지 객체를 생성하기만 하고 다른 곳에서도 새로운 객체를 생성할 필요가 없기에 static 키워드를 붙이게 됨.
 추가로 존재하는 많은 디자인 패턴에 대한 공부의 필요성을 느낌
입력과 출력은 완전히 별개로 처리함.

조금 더 고민해본 결과 Calculator에서 모든 입출력과 연산을 처리할 수 있도록 변경하는 것이 맞다고 생각하여 Receiver와 Printer를 새로 추가함.
 모든 기능을 분리하고 SRP를 지키는 것에 조금 더 다가갔다고 생각함
사용자는 Calculator 객체를 만들고 calculate라는 메서드만 실행하면 입,출력과 연산에 대해 알 필요 없이 계산을 할 수 있도록 만들고자 했음.
Calculator에서는 입력받은 연산자, 피연산자, 결과를 저장할 수 있게 함.
Calculator 내부에서 기본적으로 사용할 Receiver와 Printer의 의존성 주입을 고민하고 검색하여 초기화 구문에 기본 값으로 지정해주기로 결정
  추후 ReceiverProtocol을 따르거나 PrinterProtocol을 따르는 커스텀 객체를 만들어 주입하는 것이 가능하게 됨

이 과제를 진행하며 생각한 목표인 원칙을 지키는 구조를 어느정도 완성했다고 생각하여 클로드에게 코드리뷰를 맡기고 다음과 같은 피드백을 받게 됨
1. Calculator에 존재하는 데이터에 대해 무결성을 보장하고 안전한 값 변경을 위한 디자인 추가하는 것을 권장
2. Calculator의 데이터 입력 상태를 추적할 수 있는 변수를 추가는 것을 권장
3. 에러에 관한 처리를 Swift에서 제공하는 Error 프로토콜을 준수하는 열거형으로 처리하기를 권장
4. 테스트 용이성을 위해 OperatorFactory도 추상화를 진행할 것을 권장

코드리뷰를 통해 다음과 같은 부분에 대한 지식이 부족함을 알게 됨
1. 데이터의 무결성을 지키는 좋은 방법과 상태를 추적하는 것의 장점
2. Error 프로토콜에 관한 내용
3. 테스트에 용이하도록 작성한 코드로 실제 객체마다의 테스트를 해보는 방법

내가 생각하는 이번 과제의 목표는 달성했으나 피드백 받은 부분에 대한 구현도 고민해보고 추가할 예정.












