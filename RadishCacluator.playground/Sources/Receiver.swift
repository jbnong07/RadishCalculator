/*
 입력 받는 부분은 문자열을 반환하는 입력과 정수를 반환하는 입력
 추후에 실수를 반환하는 입력을 추가할 생각
 실제로는 앱의 버튼입력을 받아오거나 readLine()을 받아야 할텐데 여기서는 이번 과제는 입력 부분에서 하드코딩으로 구현
 */

/*
 Receiver를 별도의 프로토콜을 안 따르는 채로 타입처럼 쓰려고 하니 오류가 발생함.
 Initializer 'init()' is internal and cannot be referenced from a default argument value
 
 */


public protocol ReceiverProtocol {
    func receiveOperand() -> Int?
    
    func receiveOperator() -> String?
    
    init()
}
public class Receiver: ReceiverProtocol {
    
    public func receiveOperand() -> Int? {
        //3을 받았다고 가정하고 반환
        return 3
    }
    
    public func receiveOperator() -> String? {
        //add를 받았다고 가정하고 반환
        return "add"
    }
    
    public required init(){
        
    }
}
