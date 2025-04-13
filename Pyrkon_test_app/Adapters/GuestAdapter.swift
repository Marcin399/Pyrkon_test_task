import Foundation

final class GuestAdapter: GuestAdapterProtocol {
    func adapt(dto: GuestDTO) -> Guest {
        Guest(
            name: dto.name,
            summary: dto.summary,
            imageURL: URL(string: dto.imageURL) ?? URL(string: "https://fallback.image")!,
            zones: dto.zones.compactMap { Zone(rawValue: $0) }
        )
    }
} 