import Foundation

final class JSONGuestService: GuestServiceProtocol {
    func fetchGuests() async -> [GuestDTO] {
        guard let url = Bundle.main.url(forResource: "guests", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Failed to find JSON file")
            return []
        }
        
        do {
            return try JSONDecoder().decode([GuestDTO].self, from: data)
        } catch {
            print("JSON decoding error: \(error)")
            return []
        }
    }
} 