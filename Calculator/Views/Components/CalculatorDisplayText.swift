import SwiftUI

extension CalculatorView {
    struct CalculatorDisplayText: View {
        @EnvironmentObject private var viewModel: CalculatorViewModel

        var body: some View {
            Text(viewModel.displayText)
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 88, weight: .light))
                .lineLimit(1)
                .minimumScaleFactor(0.2)
        }
    }
}
