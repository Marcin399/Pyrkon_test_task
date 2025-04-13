import SwiftUI

struct GuestDetailView: View {
    let guest: Guest
    let guests: [Guest]
    var safeArea: EdgeInsets
    var size: CGSize
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    let progress = minY / (size.height * 0.45 * (minY > 0 ? 0.5 : 0.8))
                    
                    GuestImageHeader(guest: guest, size: size, minY: minY, progress: progress)
                }
                .frame(height: size.height * 0.45 + safeArea.top)
                
                VStack(alignment: .leading, spacing: 20) {
                    GuestSummarySection(summary: guest.summary)
                    
                    if let _ = guest.zones.first {
                        SimilarGuestsSection(guest: guest, guests: guests)
                    }
                }
                .offset(y: -55)
                .zIndex(0)
            }
        }
        .background(Color.Theme.backgroundDetailGradient)
        .coordinateSpace(name: "SCROLL")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
    
    private func iconForZone(_ zone: Zone) -> String {
        switch zone {
        case .literacka:
            return "book.fill"
        case .komiksowa:
            return "paintbrush.fill"
        case .filmowa:
            return "film.fill"
        case .naukowa:
            return "atom"
        case .cosplay:
            return "person.fill.checkmark"
        case .muzyczna:
            return "music.note"
        }
    }
}

#Preview {
    GuestListView(viewModel: GuestListViewModel(guestService: JSONGuestService(), guestAdapter: GuestAdapter()))
}
