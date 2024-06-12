import SwiftUI

struct ListView: View {
    @State private var places: [Place] = []
    var category: String

    var body: some View {
        List(places) { place in
            NavigationLink(destination: MapDetailView(place: place)) {
                Text(place.name)
            }
        }
        .onAppear {
            fetchPlaces()
        }
    }

    func fetchPlaces() {
        // Fetch places from API based on category
        APIClient.fetchPlaces(for: category) { places in
            self.places = places
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(category: "pubs")
    }
}
