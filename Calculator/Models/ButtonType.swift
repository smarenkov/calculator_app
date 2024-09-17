import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    case negative
    case percent
    case decimal
    case equal
    case allClear
    case clear

    var description: String {
        switch self {
            case .digit(let digit):
                return digit.description
            case .operation(let operation):
                return operation.description
            case .negative:
                return "+/-"
            case .percent:
                return "%"
            case .decimal:
                return "."
            case .equal:
                return "="
            case .allClear:
                return "AC"
            case .clear:
                return "C"
        }
    }

    var backgroundColor: Color {
        switch self {
            case .allClear, .clear, .negative, .percent:
                return Color(.lightGray)
            case .operation, .equal:
                return Color(.orange)
            case .digit, .decimal:
                return Color(.darkGray)
        }
    }

    var foregroundColor: Color {
        switch self {
            case .allClear, .clear, .negative, .percent:
                return Color(.black)
            default:
                return Color(.white)
        }
    }
}
