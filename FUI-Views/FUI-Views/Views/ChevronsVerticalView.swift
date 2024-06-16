import SwiftUI

struct ChevronsVerticalView: View {
    @State private var litUpIndex: Int? = nil
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach((5..<15), id: \.self) { index in
                ChevronVertical(chevronWidth: CGFloat(50 + index * 5), chevronHeight: CGFloat(20 + index * 10), lineThickness: 2)
                    .stroke(self.litUpIndex == index ? Color(UIColor(hex: ColorName.tron.rawValue)) : Color.black, lineWidth: CGFloat(1 + index))
                    .frame(width: CGFloat(10 + index * 5), height: CGFloat(25 + index * 1))
            }
        }
        .background(Color.clear)
        .onTapGesture {
            self.animateChevrons()
        }
    }
    
    private func animateChevrons() {
        for index in (5..<15) {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(14 - index) * 0.1) {
                withAnimation {
                    self.litUpIndex = index
                }
            }
        }
        
        // Reset the litUpIndex after the animation completes
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(15 - 5) * 0.1 + 0.5) {
            withAnimation {
                self.litUpIndex = nil
            }
        }
    }
}

struct ChevronsVerticalView_Preview: PreviewProvider {
    static var previews: some View {
        ChevronsVerticalView()
    }
}
