import Combine
import Foundation

extension CalculatorView {
    final class CalculatorViewModel: ObservableObject {
        @Published private var calculator = Calculator()

        var displayText: String {
            return calculator.displayText
        }

        var buttonTypes: [[ButtonType]] {
            let clearType: ButtonType = calculator.showAllClear ? .allClear : .clear

            return [
                [clearType, .negative, .percent, .operation(.division)],
                [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
                [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
                [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
                [.digit(.zero), .decimal, .equal]
            ]
        }

        func performAction(for buttonType: ButtonType) {
            switch buttonType {
                case .digit(digit: let digit):
                    calculator.setDigit(digit)
                case .operation(operation: let operation):
                    calculator.setOperation(operation)
                case .negative:
                    calculator.toggleNegative()
                case .percent:
                    calculator.setPersent()
                case .decimal:
                    calculator.setDecimal()
                case .equal:
                    calculator.evaluate()
                case .allClear:
                    calculator.allClear()
                case .clear:
                    calculator.clear()
            }
        }

        func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
            guard case .operation(let operation) = buttonType else {
                return false
            }

            return calculator.operationIsHightlighted(operation)
        }
    }
}
