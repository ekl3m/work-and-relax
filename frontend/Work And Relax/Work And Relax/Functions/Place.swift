import Foundation
import MapKit

struct Place: Identifiable, Codable {
   let id = UUID()
   let name: String
   let latitude: Double
   let longitude: Double
   let imageURL: String

   var coordinate: CLLocationCoordinate2D {
       CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
   }
}
