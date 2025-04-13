import SwiftUI

final class AppCoordinator: ObservableObject {
    @MainActor
    func makeGuestListView() -> some View {
        let guestService = JSONGuestService()
        let adapter = GuestAdapter()
        let viewModel = GuestListViewModel(guestService: guestService, guestAdapter: adapter)
        return GuestListView(viewModel: viewModel)
    }
} 