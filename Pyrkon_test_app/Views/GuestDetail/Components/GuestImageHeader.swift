import SwiftUI

struct GuestImageHeader: View {
    let guest: Guest
    let size: CGSize
    let minY: CGFloat
    let progress: CGFloat
    
    var body: some View {
        AsyncImage(url: guest.imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
        .frame(width: size.width, height: size.height * 0.45 + (minY > 0 ? minY : 0))
        .clipped()
        .overlay(content: {
            ZStack(alignment: .bottom) {
                
                Rectangle()
                    .fill(
                        .linearGradient(colors: [
                            .black.opacity(0 - progress),
                            .black.opacity(0.1 - progress),
                            .black.opacity(0.3 - progress),
                            .black.opacity(0.5 - progress),
                            .black.opacity(0.8 - progress),
                            .black.opacity(1),
                        ], startPoint: .top, endPoint: .bottom)
                    )
                
                VStack(spacing: 0) {
                    Text(guest.name)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text(guest.zones.first?.rawValue.uppercased() ?? "")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 35)
                        .padding(.vertical, 12)
                        .background {
                            Capsule()
                                .fill(Color.Theme.blueGradient)
                        }
                        .offset(y:25)
                    
                }
                .opacity(1 + (progress > 0 ? -progress : progress))
                .padding(.bottom, 0)
                .offset(y: minY < 0 ? minY : 0)
            }
        })
        .offset(y: -minY)
    }
}
