import SwiftUI
import MapKit

struct MapDetailView: View {
    var place: Place

    @State private var region: MKCoordinateRegion

    init(place: Place) {
        self.place = place
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: [place]) { place in
                MapPin(coordinate: place.coordinate)
            }
            .edgesIgnoringSafeArea(.top)
            .frame(height: 300)

            Button(action: navigate) {
                Text("Navigate")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }

    func navigate() {
        let coordinate = CLLocationCoordinate2DMake(place.latitude, place.longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        mapItem.name = place.name
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
}

struct MapDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MapDetailView(place: Place(name: "Bar Index", latitude: -33.86, longitude: 151.20, imageURL: ""))
    }
}
