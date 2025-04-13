import Foundation

protocol GuestAdapterProtocol {
    func adapt(dto: GuestDTO) -> Guest
} 