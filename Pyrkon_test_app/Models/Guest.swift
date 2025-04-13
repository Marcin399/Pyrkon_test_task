import Foundation

struct Guest: Identifiable {
    let id = UUID()
    let name: String
    let summary: String
    let imageURL: URL
    let zones: [Zone]
} 