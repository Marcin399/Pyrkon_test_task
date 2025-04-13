import Foundation

struct GuestDTO: Decodable {
    let name: String
    let summary: String
    let imageURL: String
    let zones: [String]
} 