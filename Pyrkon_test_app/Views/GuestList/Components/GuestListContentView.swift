import SwiftUI

struct GuestListContentView: View {
    @ObservedObject var viewModel: GuestListViewModel
    
    var body: some View {
        ForEach(viewModel.filteredGuests) { guest in
            NavigationLink(destination: {
                GeometryReader {
                    let safeArea = $0.safeAreaInsets
                    let size = $0.size
                    GuestDetailView(guest: guest, guests: viewModel.guests, safeArea: safeArea, size: size)
                        .ignoresSafeArea(.container, edges: .top)
                }
            }) {
                GuestRow(guest: guest)
            }
            .lineLimit(1)
        }
    }
} 