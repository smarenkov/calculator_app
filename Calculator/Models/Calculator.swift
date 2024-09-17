import Foundation

struct Calculator {
    private struct ArithmeticExpression {
        var number: Decimal
        var operation: ArithmeticOperation
        
        func evaluate(with secondNumber: Decimal) -> Decimal {
            switch operation {
                case .addition:
                    return number + secondNumber
                case .subtraction:
                    return number - secondNumber
                case .multiplication:
                    return number * secondNumber
                case .division:
                    return number / secondNumber
            }
        }
    }
    
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            
            isPressedClear = false
            isNegative = false
            isDecimal = false
            zeroCount = 0
        }
    }
    
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    
    private var isPressedClear: Bool = false
    private var isNegative: Bool = false
    private var isDecimal: Bool = false
    private var zeroCount: Int = 0
    
    var displayText: String {
        return getNumberString(forNumber: number, withCommas: true)
    }
    
    var showAllClear: Bool {
        return newNumber == nil && expression == nil && result == nil || isPressedClear
    }
    
    var number: Decimal? {
        if isPressedClear || isDecimal {
            return newNumber
        }
        return newNumber ?? expression?.number ?? result
    }
    
    private var isContainDecimal: Bool {
        return getNumberString(forNumber: number).contains(".")
    }
    
    mutating func setDigit(_ digit: Digit) {
        if isContainDecimal, digit == .zero {
            zeroCount += 1
            return
        }
        let numberString = getNumberString(forNumber: newNumber)
        newNumber = Decimal(string: numberString.appending(digit.description))
    }
    
    mutating func setOperation(_ operation: ArithmeticOperation) {
        guard var number = newNumber ?? result else { return }
        
        if let existingExpression = expression {
            number = existingExpression.evaluate(with: number)
        }
        expression = ArithmeticExpression(number: number, operation: operation)
        newNumber = nil
    }
    
    mutating func toggleNegative() {
        if let number = newNumber {
            newNumber = -number
            return
        }
        if let number = result {
            result = -number
            return
        }
        
        isNegative.toggle()
    }
    
    mutating func setPersent() {
        if let number = newNumber {
            newNumber = number / 100
            return
        }
        if let number = result {
            result = number / 100
            return
        }
    }
    
    mutating func setDecimal() {
        if isContainDecimal { return }
        isDecimal = true
    }
    
    mutating func allClear() {
        newNumber = nil
        expression = nil
        result = nil
        isNegative = false
        isDecimal = false
        zeroCount = 0
    }
    
    mutating func clear() {
        newNumber = nil
        isPressedClear = true
        isNegative = false
        isDecimal = false
        zeroCount = 0
    }
    
    mutating func evaluate() {
        guard let number = newNumber, let expressionToEvaluate = expression else { return }
        
        result = expressionToEvaluate.evaluate(with: number)
        expression = nil
        newNumber = nil
    }
    
    func operationIsHightlighted(_ operation: ArithmeticOperation) -> Bool {
        return expression?.operation == operation && newNumber == nil
    }
    
    private func getNumberString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
        var numberString = (withCommas ? String(describing: number ?? 0).replacingOccurrences(of: ",", with: "") : String(describing: number ?? 0))
        
        if isNegative {
            numberString.insert("-", at: numberString.startIndex)
        }
        if isDecimal {
            numberString.insert(".", at: numberString.endIndex)
        }
        if zeroCount > 0 {
            numberString.append(String(repeating: "0", count: zeroCount))
        }
         
        return numberString
    }
}
