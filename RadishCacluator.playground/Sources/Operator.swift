/*
 연산 클래스는 연산 기능을 하는 메소드를 가짐
 연산 기능 메서드는 Int를 반환해야 함
 초기화 시 정수 2개를 받아와야 함
 */

import Foundation

//접근 수준이 기본적으로 internal이기 때문에
//다른 파일에서 사용할 수 있도록 public 선언
public protocol AbstractOperatorProtocol {
    //프로토콜에선 저장 프로퍼티를 사용할 수 없으며,
    //연산 프로퍼티에선 let을 사용할 수 없어 읽기 전용으로 선언함.
//    var firstOperand: Int { get }
//    var secondOperand: Int { get }
  // >> 오퍼레이터에서도 정수를 가지고 있는 것보다 오퍼레이터의 메서드에서 바로 전달받고 사용하는 것이 맞다고 판단하여 삭제    
    
    func operate(_ firstOperand: Int?, _ secondOperand: Int?) -> Int?
    
    //피연산자를 받는 초기화 구문이 필요함
//    init(firstOperand: Int, secondOperand: Int)
    //오퍼레이터가 피연산자를 가지고 있을 필요가 없어졌기 때문에 속성을 정의하는 초기화구문도 삭제
    
    //자동으로 생성되는 class 이니셜라이저의 접근수준을 잊지 않고 제어하기 위해 이니셜라이저 선언
    init()
}

private class Add: AbstractOperatorProtocol {

    public func operate(_ firstOperand: Int?, _ secondOperand: Int?) -> Int? {
        if let first = firstOperand, let second = secondOperand {
            return first + second
        } else {
            return nil
        }
    }
    
    public required init() {
        
    }
    
    //required를 붙임으로써 추후 서브클래스에서도 해당 이니셜라이저를 반드시 가지도록 할 수 있음
//    public required init(firstOperand: Int, secondOperand: Int) {
//        self.firstOperand = firstOperand
//        self.secondOperand = secondOperand
//    }
    
    
}

//빼기 연산
private class Sub: AbstractOperatorProtocol {
    public func operate(_ firstOperand: Int?, _ secondOperand: Int?) -> Int? {
        if let first = firstOperand, let second = secondOperand {
            return first - second
        } else {
            return nil
        }
    }
    
    public required init(){
        
    }
}

private class Mul: AbstractOperatorProtocol {
    public func operate(_ firstOperand: Int?, _ secondOperand: Int?) -> Int? {
        if let first = firstOperand, let second = secondOperand {
            return first * second
        } else {
            return nil
        }
    }
    
    public required init(){
        
    }
}

private class Div: AbstractOperatorProtocol {
    public func operate(_ firstOperand: Int?, _ secondOperand: Int?) -> Int? {
        if let first = firstOperand, let second = secondOperand {
            return first / second
        } else {
            return nil
        }
    }
    
    public required init(){
        
    }
}

//팩토리 패턴 구현 >> 외부에서 switch 쓰는 대신 유지 보수를 용이하려고 함.
public class OperatorFactory {
    //static을 붙여서 객체를 생성하지 않고도 접근가능한 메서드를 만듬
    public static func createOperator(_ inputOperator: String) -> AbstractOperatorProtocol? {
        switch inputOperator {
        case "+":
            return Add()
        case "-":
            return Sub()
        case "*":
            return Mul()
        case "/":
            return Div()
        default:
            return nil
        }
    }
    //이니셜라이저를 private으로 설정하여 불필요한 객체 생성을 막음.
    private init(){
        
    }
}
