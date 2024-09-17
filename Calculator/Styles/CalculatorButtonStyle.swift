import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    var isWide: Bool = false
    var size: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 32, weight: .medium))
            .frame(width: size, height: size)
            .frame(maxWidth: isWide ? .infinity : size, alignment: .leading)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.2)
                }
            }
            .clipShape(Capsule())
    }
}
