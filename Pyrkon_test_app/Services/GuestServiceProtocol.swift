import Foundation

protocol GuestServiceProtocol {
    func fetchGuests() async -> [GuestDTO]
} 