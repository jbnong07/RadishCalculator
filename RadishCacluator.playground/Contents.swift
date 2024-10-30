/*
 계산기의 목표
 정수 2개와 연산자를 입력받아 연산결과를 출력한다.
  
 Calculator의 기능
 입력 - 정수, 연산자
 출력 - 연산 결과
  
 Operator의 기능
 입력 - 피연산 정수 2개
 출력 - 연산 결과 정수 1개
 
 Calculator에선 입출력 Operator에선 실제 연산을 담당하여 기능을 분리함.
 다양한 Operator의 공통된 부분을 추상화하여 AbstractOperator라는 프로토콜을 준수하도록 함.
 Calculator 내부에서 객체를 선언하는 것이 아닌 외부에서 선언한 Operator를 주입받음.
 
*/

/*
 2024.10.30 변경사항
 Calculator의 기능을 다시 분리하기로 결정.
 입력을 담당하는 Receiver와 출력을 담당하는 Printer를 생성하고
 Calculatro는 연산에 필요한 데이터를 저장하고 입출력, 연산 객체를 주입받아 실행하는 역할
 이를 통해서 Calculator.calculate() 한 줄로 모든 연산과정이 끝날 수 있으면 사용자 입장에서 깔끔해서 좋을 거라고 생각하게 됨.
 
 계산할 정수를 입력하세요 입력한 수는 ~입니다와 같은 부분도 전부 Printer에서 담당하는 것이 옳은지 헷갈렸지만,
 기능을 출력이라고 정의했으니 Printer가 모든 출력에 관여하는 게 맞다고 생각함.
 
 
 추후 개선 하고 싶은 사항
 1. 스위프트에서 지원하는 에러 프로토콜을 따르는 에러처리로 변환하기
 2. Calculator의 데이터에 직접 접근이 아닌 메서드를 통한 변경과 현재 입력 상태와 에러 상태를 추적할 수 있는 변수 만들기
 3. 오퍼레이터 팩토리 또한 추상화하고 타입 형태로 의존성 주입 후 사용하기
 4. 각 객체들을 테스트하는 방법 생각하고 테스트해보기
 */

let radishCalculator = Calculator()

radishCalculator.calculate()




//
//print("계산할 정수를 입력하세요")
//print("입력한 수 3")
//print("입력한 수 4")
//
//
//radishCalculator.receiveInput(3, 4)
//
//print("사용하고 싶은 연산자를 입력하세요")
//print("입력한 연산자 add") // 또는  +
//
//
//
//radishCalculator.calculate(selectedOperator: OperatorFactory.createOperator("add"))
//
//radishCalculator.printResult()
