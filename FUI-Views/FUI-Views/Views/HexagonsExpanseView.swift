import SwiftUI

struct HexagonsExpanseView: View {
    @State private var isExpanded = false
    
    let hexagonSize: CGFloat = 80
    
    var body: some View {
        let positions: [CGPoint] = [
            CGPoint(x: -hexagonSize * 0.55, y: -hexagonSize * 0.85), // top-left
            CGPoint(x: hexagonSize * 0.55, y: -hexagonSize * 0.85), // top-right
            CGPoint(x: -hexagonSize * 1.1, y: 0), // left
            CGPoint(x: hexagonSize * 1.1, y: 0), // right
            CGPoint(x: -hexagonSize * 0.55, y: hexagonSize * 0.85), // bottom-left
            CGPoint(x: hexagonSize * 0.55, y: hexagonSize * 0.85) // bottom-right
        ]
        
        return ZStack {
            // Surrounding hexagons
            ForEach(0..<6) { index in
                Hexagon()
                    .fill(Color.white)
                    .frame(width: hexagonSize, height: hexagonSize)
                    .offset(x: isExpanded ? positions[index].x : 0, y: isExpanded ? positions[index].y : 0)
                    .animation(Animation.easeInOut(duration: 0.5).delay(Double(index) * 0.05), value: isExpanded)
                    .zIndex(-1)
            }
            
            // Center hexagon
            Hexagon()
                .fill(Color.white)
                .frame(width: hexagonSize, height: hexagonSize)
                .onTapGesture {
                    isExpanded.toggle()
                }
        }
        .background(Color.clear.edgesIgnoringSafeArea(.all))
    }
}

struct HexagonsView_Preview: PreviewProvider {
    static var previews: some View {
        HexagonsExpanseView()
    }
}
