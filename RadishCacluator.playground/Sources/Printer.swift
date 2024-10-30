/*
 Printer는 모든 문구 출력을 담당하고자 함.
 출력이 필요한 부분은 연산 시작 시 안내, 입력 요청과 재확인, 출력, 오류로 이루어짐.
 출력 문구를 커스텀하기 쉽게 프린터 프로토콜을 만들기로 결정
 */

public protocol PrinterProtocol {
    //시작 안내 메시지
    func printStartMessage()
    //피연산자 메시지
    func printReceiveOperandMessage()
    //연산자 메시지
    func printReceiveOperatorMessage()
    //입력 확인 메시지
    func printCheckReceive(_ input: Any?)
    //결과 메시지
    func printResult(_ result: Int)
    //에러 메시지
    func printErrorMessage(_ code: Int)
    
    init()
}

public class Printer: PrinterProtocol {
    
    public func printStartMessage() {
        print("계산기 작동을 시작하겠습니다.")
    }
    
    public func printReceiveOperandMessage() {
        print("피연산자가 될 정수를 입력해주세요.")
    }
    
    public func printReceiveOperatorMessage() {
        print("연산하고 싶은 연산자를 입력해주세요.")
    }
    
    //정수형 또는 문자열을 편하게 입력받기 위해 Any를 사용했음
    //int와 string만 printer에 전달될 것이라 확신해서 따로 분기처리하지 않으
    public func printCheckReceive(_ input: Any?) {
        if let input {
            print("입력: \(input)")
        } else {
            print("입력에 오류가 생겼습니다.")
        }
    }
    
    public func printResult(_ result: Int) {
        print("연산 결과: \(result)")
    }
    
    public func printErrorMessage(_ code: Int) {
        switch code {
        case 1:
            print("아직 지원하지 않는 연산자입니다.")
        case 2:
            print("정수 입력이 잘못되었습니다.")
        default:
            print("알 수 없는 오류입니다.")
        }
    }
    
    public required init(){
        
    }
    
}
