import SwiftUI

struct CirclesExpanseView: View {
    @State private var isExpanded = false

    let circleSize: CGFloat = 80
    let positions: [CGPoint] = [
        CGPoint(x: 0, y: -120), // top
        CGPoint(x: 100, y: -60), // top-right
        CGPoint(x: 100, y: 60), // bottom-right
        CGPoint(x: 0, y: 120), // bottom
        CGPoint(x: -100, y: 60), // bottom-left
        CGPoint(x: -100, y: -60) // top-left
    ]

    var body: some View {
        ZStack {
            // Surrounding circles
            ForEach(0..<6) { index in
                Circle()
                    .fill(Color.white)
                    .frame(width: circleSize, height: circleSize)
                    .offset(x: isExpanded ? positions[index].x : 0, y: isExpanded ? positions[index].y : 0)
                    .animation(Animation.easeInOut(duration: 0.5).delay(Double(index) * 0.05), value: isExpanded)
                    .zIndex(-1)
            }

            // Center circle
            Circle()
                .fill(Color.white)
                .frame(width: circleSize, height: circleSize)
                .onTapGesture {
                    isExpanded.toggle()
                }
        }
        .background(Color.clear.edgesIgnoringSafeArea(.all))
    }
}

struct CirclesExpanseView_Preview: PreviewProvider {
    static var previews: some View {
        CirclesExpanseView()
    }
}
