import SwiftUI

struct GuestSummarySection: View {
    let summary: String
    @State private var isSummaryExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("O gościu")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(summary)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(isSummaryExpanded ? nil : 4)
                    .padding(.horizontal)
                
                if summary.count > 200 {
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            isSummaryExpanded.toggle()
                        }
                    }) {
                        Text(isSummaryExpanded ? "Zwiń" : "Rozwiń")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            Rectangle()
                .fill(Color.Theme.guestRowBackgroundGradient
                   .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                   .shadow(.drop(color: .black.opacity(0.05), radius: 5, x: -5, y: -5))
                )
        }
    }
}
