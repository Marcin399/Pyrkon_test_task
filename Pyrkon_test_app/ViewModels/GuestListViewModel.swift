import SwiftUI

@MainActor
final class GuestListViewModel: ObservableObject {
    @Published private(set) var guests: [Guest] = []
    @Published private(set) var isLoading: Bool = true
    @Published var searchText: String = "" {
        didSet {
            updateFilteredGuests()
        }
    }
    @Published var selectedZone: Zone? = nil {
        didSet {
            updateFilteredGuests()
        }
    }
    @Published private(set) var filteredGuests: [Guest] = []
    
    private let guestService: GuestServiceProtocol
    private let guestAdapter: GuestAdapterProtocol
    
    init(guestService: GuestServiceProtocol, guestAdapter: GuestAdapterProtocol) {
        self.guestService = guestService
        self.guestAdapter = guestAdapter
        Task { await fetchGuests() }
    }
    
    func fetchGuests() async {
        isLoading = true
        defer { isLoading = false }
        
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        
        let dtoList = await guestService.fetchGuests()
        guests = dtoList.map { guestAdapter.adapt(dto: $0) }
        updateFilteredGuests()
    }
    
    private func updateFilteredGuests() {
        filteredGuests = guests.filter { guest in
            let matchesSearch = searchText.isEmpty || 
                guest.name.lowercased().contains(searchText.lowercased())
            let matchesZone = selectedZone == nil || guest.zones.contains(selectedZone!)
            return matchesSearch && matchesZone
        }
    }
} 
