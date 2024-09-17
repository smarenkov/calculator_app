import SwiftUI

extension CalculatorView {
    struct CalculatorButtonPad: View {
        @EnvironmentObject private var viewModel: CalculatorViewModel

        var body: some View {
            VStack(spacing: 12) {
                ForEach(viewModel.buttonTypes, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) {
                            buttonType in CalculatorButton(buttonType: buttonType)
                        }
                    }
                }
            }
        }
    }
}
