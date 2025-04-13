import SwiftUI

struct ZoneFilterView: View {
    @ObservedObject var viewModel: GuestListViewModel
    let isFocused: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(Zone.allCases, id: \.self) { zone in
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            viewModel.selectedZone = viewModel.selectedZone == zone ? nil : zone
                        }
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: iconForZone(zone))
                                .font(.system(size: 14))
                                .symbolEffect(.bounce, value: viewModel.selectedZone == zone)

                            Text(zone.rawValue.capitalized)
                                .font(.system(size: 13))
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(viewModel.selectedZone == zone ?
                                    Color(hex: 0x2A3B47) : 
                                        Color.Theme.unselectedZone).opacity( isFocused ? 1 : 0.7)
                                .overlay(
                                    viewModel.selectedZone == zone ?
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.Theme.blueGradient)
                                    : nil
                                )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white.opacity(0.07), lineWidth: 1)
                        )
                        .foregroundColor(viewModel.selectedZone == zone ? .white : .gray)
                        .scaleEffect(viewModel.selectedZone == zone ? 1.05 : 1.0)
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 4)
        }
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

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.7), value: configuration.isPressed)
    }
} 


#Preview {
    GuestListView(viewModel: GuestListViewModel(guestService: JSONGuestService(), guestAdapter: GuestAdapter()))
}
