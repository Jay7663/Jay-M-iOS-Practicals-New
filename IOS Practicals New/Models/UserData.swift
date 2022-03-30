import Foundation

struct RootUserData: Codable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [UserData]
    let support: Support
} // End of Struct

struct UserData: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
} // End of Struct

struct Support: Codable {
    let url: String
    let text: String
} // End of Struct
