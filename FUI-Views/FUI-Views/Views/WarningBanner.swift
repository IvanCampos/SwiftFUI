import SwiftUI

struct WarningBanner: View {
    var text: String = "WARNING"
    var color: Color = getColor(hex: ColorName.akira.rawValue)
    @State private var flash = false

    var body: some View {
        HStack(spacing: 8) {
            Triangle()
                .fill(color)
                .frame(width: 40, height: 40)
                .overlay(
                    Text("!")
                        .font(.headline)
                        .foregroundColor(.white)
                )
                .opacity(flash ? 0.2 : 1.0)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: flash)

            Text(text)
                .font(.headline)
                .foregroundColor(color)
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.black.opacity(0.6)))
        .onAppear {
            flash = true
        }
    }
}

struct WarningBanner_Preview: PreviewProvider {
    static var previews: some View {
        WarningBanner()
    }
}
