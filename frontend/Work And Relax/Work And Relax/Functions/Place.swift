import Foundation

struct Location: Identifiable, Codable, Equatable {
    var id: Int64
    var name: String
    var location_X: Double
    var location_Y: Double
    var photo: String
    var restaurant: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, location_X, location_Y, photo, restaurant
    }
    
    
}
