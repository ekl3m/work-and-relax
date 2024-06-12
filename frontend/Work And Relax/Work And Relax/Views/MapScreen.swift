import SwiftUI
import MapKit

struct HomeView: View {
    @State private var searchText = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.752799, longitude: 19.453228),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var restaurants: [Restaurant] = []
    @State private var showList = false
    
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.21, green: 0.33, blue: 0.56), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.57, green: 0.65, blue: 1), location: 0.49),
                    Gradient.Stop(color: .white, location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .edgesIgnoringSafeArea(.all)

            VStack {
                SearchBar(searchText: $searchText)
                    .padding(.top, 50)
                    .padding(.horizontal)

                ZStack {
                    Map(coordinateRegion: $region, showsUserLocation: true)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear {
                            if let userLocation = locationManager.userLocation {
                                region.center = userLocation
                            }
                        }

                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            
                            VStack(spacing: 10) {
                                // Show User Location Button
                                Button(action: {
                                    centerMapOnUserLocation()
                                }) {
                                    Image(systemName: "location.fill")
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .shadow(radius: 10)
                                }
                                
                                // Show Nearby Restaurants Button
                                Button(action: {
                                    fetchNearbyRestaurants()
                                }) {
                                    Image(systemName: "list.bullet")
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .shadow(radius: 10)
                                }
                            }
                            .padding(.trailing, 10)
                            .padding(.bottom, 10)
                        }
                    }
                }
                
                .padding(.top, 20)

                //Spacer()
            }

            if showList {
                RestaurantListView(restaurants: $restaurants, showList: $showList)
            }
        }
    }

    func centerMapOnUserLocation() {
        if let location = locationManager.userLocation {
            region.center = location
        }
    }

    func fetchNearbyRestaurants() {
        let baseLocation = CLLocationCoordinate2D(latitude: 51.752799, longitude: 19.453228)
        let nearbyRestaurants = [
            Restaurant(name: "Restaurant A", latitude: baseLocation.latitude + 0.001, longitude: baseLocation.longitude + 0.001),
            Restaurant(name: "Restaurant B", latitude: baseLocation.latitude - 0.001, longitude: baseLocation.longitude - 0.001),
            Restaurant(name: "Restaurant C", latitude: baseLocation.latitude + 0.002, longitude: baseLocation.longitude + 0.002),
            Restaurant(name: "Restaurant D", latitude: baseLocation.latitude - 0.002, longitude: baseLocation.longitude - 0.002),
            Restaurant(name: "Restaurant E", latitude: baseLocation.latitude + 0.003, longitude: baseLocation.longitude + 0.003)
        ]
        self.restaurants = nearbyRestaurants
        self.showList = true
    }
}

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.white))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 16)
                    }
                )
        }
        .padding(.top, 10)
    }
}

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}

struct RestaurantListView: View {
    @Binding var restaurants: [Restaurant]
    @Binding var showList: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.showList = false
                }) {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            List(restaurants) { restaurant in
                Text(restaurant.name)
            }
            .cornerRadius(10)
            .padding()
            .background(Color.white)
            .shadow(radius: 10)
        }
        .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location.coordinate
    }
}
