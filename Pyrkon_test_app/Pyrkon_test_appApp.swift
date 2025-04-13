import SwiftUI

@main
struct Pyrkon_test_appApp: App {
    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            coordinator.makeGuestListView()
                .preferredColorScheme(.dark)
        }
    }
}
