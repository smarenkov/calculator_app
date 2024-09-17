import SwiftUI

extension CalculatorView {
    struct CalculatorButton: View {
        @EnvironmentObject private var viewModel: CalculatorViewModel

        let buttonType: ButtonType

        var body: some View {
            Button(buttonType.description) {
                viewModel.performAction(for: buttonType)
            }
            .buttonStyle(CalculatorButtonStyle(
                backgroundColor: getBackgroundColor(),
                foregroundColor: getForegroundColor(),
                isWide: buttonType == .digit(.zero),
                size: getButtonSize()
            ))
        }

        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4
            let spacingCount = buttonCount + 1

            return (screenWidth - (spacingCount * 12)) / buttonCount
        }

        private func getBackgroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.foregroundColor : buttonType.backgroundColor
        }

        private func getForegroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.backgroundColor : buttonType.foregroundColor
        }
    }
}
