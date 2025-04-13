import SwiftUI

struct SimilarGuestsSection: View {
    let guest: Guest
    let guests: [Guest]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 23) {
            Text("Strefa " + String(guest.zones.first?.rawValue ?? ""))
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 15) {
                    ForEach(guests.filter { $0.id != guest.id && $0.zones.contains(guest.zones.first!) }) { similarGuest in
                        NavigationLink(destination: {
                            GeometryReader {
                                let safeArea = $0.safeAreaInsets
                                let size = $0.size
                                GuestDetailView(guest: similarGuest, guests: guests, safeArea: safeArea, size: size)
                                    .ignoresSafeArea(.container, edges: .top)
                            }
                        }) {
                            VStack(alignment: .leading, spacing: 8) {
                                AsyncImage(url: similarGuest.imageURL) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 120, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text(similarGuest.name)
                                    .font(.system(size: 10))
                                    .fontWeight(.medium)
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 120, alignment: .leading)
                            }
                        }
                    }
                }
                .padding(.horizontal)
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
