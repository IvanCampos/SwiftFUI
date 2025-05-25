import SwiftUI

struct GlowingBoxOutline<Content: View>: View {
    var color: Color = getColor(hex: ColorName.tron.rawValue)
    var lineWidth: CGFloat = 2.0
    let content: () -> Content
    @State private var glow = false

    var body: some View {
        content()
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color.opacity(glow ? 0.5 : 1.0), lineWidth: lineWidth)
                    .shadow(color: color.opacity(glow ? 0.8 : 0.3), radius: 10)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: glow)
            )
            .onAppear {
                glow = true
            }
    }
}

struct GlowingBoxOutline_Preview: PreviewProvider {
    static var previews: some View {
        GlowingBoxOutline {
            Text("Glowing")
        }
    }
}
