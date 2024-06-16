import SwiftUI

struct CurrentDayView: View {
    let daysOfWeek = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
    let currentDay: String
    
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        currentDay = formatter.string(from: Date()).uppercased()
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(daysOfWeek, id: \.self) { day in
                Text(futureScape(day))
                    .font(.custom("Orbitron-Regular", size: 24))
                    .foregroundColor(day == currentDay ? .cyan : .gray)
            }
        }
        .background(Color.clear)
        .cornerRadius(10)
    }
}

struct CurrentDayView_Preview: PreviewProvider {
    static var previews: some View {
        CurrentDayView()
    }
}
