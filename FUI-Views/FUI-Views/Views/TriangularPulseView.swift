import SwiftUI

struct TriangularPulseView: View {
    public var color: Color = Color.gray
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            // Static center triangle
            Triangle()
                .fill(color)
                .frame(width: 100, height: 100)

            // Pulsing triangles
            ForEach(0..<5) { index in
                Triangle()
                    .stroke(Color.black.opacity(Double(5 - index) * 0.2), lineWidth: 10)
                    .frame(width: self.isAnimating ? CGFloat(100 + (index * 40)) : 100,
                           height: self.isAnimating ? CGFloat(100 + (index * 40)) : 100)
                    .scaleEffect(self.isAnimating ? 1.5 : 1.0)
                    .opacity(self.isAnimating ? 0.0 : 1.0)
                    .animation(Animation.easeInOut(duration: 1.5)
                                .repeatCount(7, autoreverses: true)
                                .delay(Double(index) * 0.3),
                               value: isAnimating)
            }
        }
        .background(Color.clear.edgesIgnoringSafeArea(.all))
        .onTapGesture {
            self.isAnimating.toggle()
        }
    }
}

struct TriangularPulseView_Preview: PreviewProvider {
    static var previews: some View {
        TriangularPulseView()
    }
}
