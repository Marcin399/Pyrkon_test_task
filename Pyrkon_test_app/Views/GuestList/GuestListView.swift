import SwiftUI

struct GuestListView: View {
    @ObservedObject var viewModel: GuestListViewModel
    @State private var progress: CGFloat = 0
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack() {
                    if viewModel.isLoading {
                        GuestListSkeletonView()
                    } else if viewModel.filteredGuests.isEmpty {
                        EmptyGuestListView()
                    } else {
                        GuestListContentView(viewModel: viewModel)
                    }
                }
                .padding(15)
                .offset(y: isFocused ? 0 : progress * 75)
                .padding(.bottom, isFocused ? 0 : progress * 75)
                .safeAreaInset(edge: .top, spacing: 0) {
                    SearchHeaderView(
                        viewModel: viewModel,
                        isFocused: isFocused,
                        progress: progress,
                        searchFieldFocused: $isFocused
                    )
                }
                .scrollTargetLayout()
                .onGeometryChange(for: CGFloat.self) {
                    let minY = $0.frame(in: .scrollView(axis: .vertical)).minY
                    let progress = max(min(-minY / 75, 1), 0)
                    return progress
                } action: { newValue in
                    progress = newValue
                }
            }
            .scrollTargetBehavior(CustomScrollTarget())
            .animation(.snappy(duration: 0.3, extraBounce: 0), value: isFocused)
            .background(Color.Theme.backgroundListGradient)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    GuestListView(viewModel: GuestListViewModel(guestService: JSONGuestService(), guestAdapter: GuestAdapter()))
} 
