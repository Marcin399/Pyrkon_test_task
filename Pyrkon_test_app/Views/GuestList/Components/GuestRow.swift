import SwiftUI

struct GuestRow: View {
    let guest: Guest
    
    var body: some View {
        HStack {
            AsyncImage(url: guest.imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.trailing, 10)

            VStack(alignment: .leading) {
                Text(guest.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(guest.zones.map { $0.rawValue.capitalized }.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(.gray)
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
        }
        .padding(.vertical, 3)
    }
} 
