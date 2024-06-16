import SwiftUI

struct ChevronsHorizontalView: View {
    @State private var animate = false
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<7) { index in
                ChevronHorizontal()
                    .fill(animate ? Color.white : Color.black)
                    .frame(width: 100, height: 100)
                    .animation(Animation.easeInOut(duration: 1).delay(Double(index) * 0.2), value: animate)
            }
        }
        .background(Color.clear)
        .onTapGesture {
            animate.toggle()
        }
    }
}

struct ChevronsHorizontalView_Preview: PreviewProvider {
    static var previews: some View {
        ChevronsHorizontalView()
    }
}
