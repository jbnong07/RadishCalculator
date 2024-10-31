/*
 Calculatore에서는 연산에 필요한 데이터를 저장하고
 연산 시작 함수 내에서 리시버, 프린터, 오퍼레이터를 주입 받아서 사용하고자 함.
 
 
 10.30
 calculate 함수를 사용하면
 1. 오퍼랜드 입력받음
 2. 오퍼레이터 입력 받음
 3. 오퍼랜드 입력받음
 4. 결과를 출력함
 
 리시버와 프린터를 초기화 시 주입 받아야 할 거 같은데 Calculator 사용 시 리시버와 프린터의 존재도 알 필요 없게 만들고 싶음
 >> 초기화 시 미리 기본 값을 정해두는 방식밖에 안 떠오르는 중. 대신 이렇게 하면 프린터의 프로토콜을 설정해서 사용자가 원하는 프린터 문구를 커스텀하고 커스텀한 프린터를 넣는 걸 지원할 수 있을 거라 생각함.
 */


import Foundation

public final class Calculator {
    private var data: CalculatorData = CalculatorData()
    private let receiver: ReceiverProtocol
    private let printer: PrinterProtocol
    
//    //이번 과제는 직접 입력받지 않고 바로 정수를 전달하도록 코딩
//    public func receiveInput(_ first: Int, _ second: Int) {
//        self.firstOperand = first
//        self.secondOperand = second
//    }
    
    //오퍼레이터를 전달받아 사용
    //프로토콜은 타입으로 사용하여 해당 프로토콜을 준수하는 인스턴스를 매개변수로 받을 수 있음
    //조금 더 명확하게 구체적인 타입이 아닌 프로토콜을 따르는 것이란 의도를 전달하도록 any를 쓰는 걸 권장한다고 하여 any를 추가함
    
    //
    public func calculate() {
//        if let selectedOperator {
//            self.data.result = selectedOperator.operate(self.data.firstOperand, self.data.secondOperand)
//        } else {
//            print("입력하신 연산을 지원하지 않습니다.")
//        }
        
        //계산 시작 안내
        printer.printStartMessage()
        
        //피연산자 입력 안내
        printer.printReceiveOperandMessage()
        //리시버로 Calculator의 data.firstOperand에 입력받음
        data.firstOperand = receiver.receiveOperand()
        //입력 재확인
        printer.printCheckReceive(data.firstOperand)
        
        //연산자 입력 안내
        printer.printReceiveOperatorMessage()
        //리시버로 연산자 입력
        data.operatorString = receiver.receiveOperator()
        //입력 재확인
        printer.printCheckReceive(data.operatorString)
        
        //두 번째 피연산자 입력 안내
        printer.printReceiveOperandMessage()
        //피연산자 입력
        data.secondOperand = receiver.receiveOperand()
        //입력 재확인
        printer.printCheckReceive(data.secondOperand)
        
        //연산 결과 result에 입력 / 입력받은 연산이 없다면 반환되는 nil을 통해 에러 메세지 출력과 함께 종료
        guard let selectedOperator = OperatorFactory.createOperator(data.operatorString ?? "nil error") else {
            printer.printErrorMessage(1)
            return
        }
        self.data.result = selectedOperator.operate(data.firstOperand, data.secondOperand)
        //결과가 nil일 경우 정수 입력에서 문제가 발생했다고 판단하고 종료
        guard let result = data.result else {
            printer.printErrorMessage(2)
            return
        }
        //결과 출력
        self.printer.printResult(result)
        //종료
        return
    }
    
    //프린터를 사용하는 것으로 변경
//    //결과 값 출력
//    public func printResult() {
//        print("연산 결과: \(result)")
//    }
    
    public init(receiver: ReceiverProtocol = Receiver(), printer: PrinterProtocol = Printer()){
        self.receiver = receiver
        self.printer = printer
    }
    
}

//확장을 통해 계산에 필요한 데이터를 구조화 함.
//리시버를 통해서만 해당 값을 입력받고 입력 누락이나 초기값으로 잘못된 연산이 발생하는 일을 줄이려고 옵셔널로 타입 지정.
extension Calculator {
    struct CalculatorData {
        var firstOperand: Int?
        var secondOperand: Int?
        var operatorString: String?
        var result: Int?
    }
    
    
    //현재는 각각의 피연산자마다 수정하는 메서드를 만들었지만 추후에는 현재 받는 입력이 어떤, 몇 번째 입력인지 추적하는 상태변수를 통해
    //하나의 메서드로 묶을 수 있다면 더욱 간결해질 거라 생각함.
    private func inputFirstOperand(receiveOperand: Int?){
    }
}






