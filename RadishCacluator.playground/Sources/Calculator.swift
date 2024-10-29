import Foundation

public final class Calculator {
    var firstOperand: Int = 0
    var secondOperand: Int = 0
    var result: Int = 0
    
    //이번 과제는 직접 입력받지 않고 바로 정수를 전달하도록 코딩
    public func receiveInput(_ first: Int, _ second: Int) {
        self.firstOperand = first
        self.secondOperand = second
    }
    
    //오퍼레이터를 전달받아 사용
    //프로토콜은 타입으로 사용하여 해당 프로토콜을 준수하는 인스턴스를 매개변수로 받을 수 있음
    public func calculate(selectedOperator: AbstractOperatorProtocol?) {
        if let selectedOperator {
            result = selectedOperator.operate(self.firstOperand, self.secondOperand)
        } else {
            print("입력하신 연산을 지원하지 않습니다.")
        }
    }
    //결과 값 출력
    public func printResult() {
        print("연산 결과: \(result)")
    }
    
    public init(){
    }
    
}
