import Foundation

// MARK: - User
struct User: Codable {
    let totalCount: Int
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
// MARK: - Item
struct Item: Codable {
    let login: String
    let avatarURL: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case type
    }
}
