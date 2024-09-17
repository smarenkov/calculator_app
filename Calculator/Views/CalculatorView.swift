import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject private var viewModel: CalculatorViewModel

    var body: some View {
        VStack {
            Spacer()
            CalculatorDisplayText()
            CalculatorButtonPad()
        }
        .padding(12)
        .background(Color.black)
    }
}

#Preview {
    CalculatorView()
        .environmentObject(CalculatorView.CalculatorViewModel())
}
