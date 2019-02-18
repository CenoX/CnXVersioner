import Foundation

struct AppVersion: Codable {
    var currentVersion: String
    var pastVersions: [String]
}
