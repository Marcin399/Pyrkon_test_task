import SwiftUI

struct GuestListSkeletonView: View {
    var body: some View {
        ForEach(0..<8) { _ in
            HStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.Theme.unselectedZone)
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading, spacing: 4) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.Theme.unselectedZone)
                        .frame(height: 20)
                        .frame(maxWidth: 150)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.Theme.unselectedZone)
                        .frame(height: 16)
                        .frame(maxWidth: 100)
                }
                Spacer()
            }
            .padding(10)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.Theme.guestRowBackgroundGradient
                       .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                       .shadow(.drop(color: .black.opacity(0.05), radius: 5, x: -5, y: -5))
                    )
                    .stroke(Color.Theme.guestRowStrokeGradient, lineWidth: 1)
                    .shimmer()
            }
            .padding(.vertical, 3)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
} 