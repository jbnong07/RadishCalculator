/*
 입력 받는 부분은 문자열을 반환하는 입력과 정수를 반환하는 입력
 추후에 실수를 반환하는 입력을 추가할 생각
 실제로는 앱의 버튼입력을 받아오거나 readLine()을 받아야 할텐데 여기서는 이번 과제는 입력 부분에서 하드코딩으로 구현
 */

/*
 Receiver를 별도의 프로토콜을 안 따르는 채로 타입처럼 쓰려고 하니 오류가 발생함.
 Initializer 'init()' is internal and cannot be referenced from a default argument value
 
 */

/*
 입력받는 관련 키워드들이 하나의 특정한 연산 기호로 반환 되도록 딕셔너리를 이용하기로 결정
 입력받은 값에 대한 유효성 검사를 하기 위한 로직 작성
 
 */

public protocol ReceiverProtocol {
    func receiveOperand() -> Int?
    
    func receiveOperator() -> String?
    
    init()
}
public class Receiver: ReceiverProtocol {
    
    private let operatorKeywordDict: [String?:String] = [
        "add":"+",
        "+":"+",
        "sub":"-",
        "-":"-",
        "mul":"*",
        "*":"*",
        "div":"/",
        "/":"/"
    ]
    
    public func receiveOperand() -> Int? {
        //let input = readLine()을 실행했다고 가정
//        let input: String? = "hello"
        let input: String? = "0"
        if let checkedInput = input {
            if let isIntTypeInput = Int(checkedInput) {
                return isIntTypeInput
            }
            else {
                //추후 숫자 입력이 안 되었다는 에러를 반환
                return nil
            }
        } else {
            //추후 문자열이 입력 안 된 경우의 에러를 반환
            return nil
        }
        
    }
    
    public func receiveOperator() -> String? {
        //let input = readLine()을 실행했다고 가정
        let input: String? = "div"
        if let returnSymbol = operatorKeywordDict[input] {
            return returnSymbol
        } else {
            //추후 지원하지 않는 연산자라는 오류 출력
            return nil
        }
    }
    
    public required init(){
        
    }
}
