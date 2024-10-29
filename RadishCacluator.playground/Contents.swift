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

let radishCalculator = Calculator()

print("계산할 정수를 입력하세요")
print("입력한 수 3")
print("입력한 수 4")


radishCalculator.receiveInput(3, 4)

print("사용하고 싶은 연산자를 입력하세요")
print("입력한 연산자 add") // 또는  +



radishCalculator.calculate(selectedOperator: OperatorFactory.createOperator("add"))

radishCalculator.printResult()





