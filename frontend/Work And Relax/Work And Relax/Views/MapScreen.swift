import SwiftUI
import MapKit

struct HomeView: View {
    @State private var searchText = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.752799, longitude: 19.453228),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var showList = false
    @State private var selectedLocation: Location? = nil
    @State private var showRestaurants = true

    @StateObject private var locationManager = LocationManager()
    @StateObject private var locationViewModel = LocationViewModel()

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
                ZStack {
                    Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: locationViewModel.locations.filter { _ in region.span.latitudeDelta < 0.02 }) { location in
                        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.location_X, longitude: location.location_Y)) {
                            Button(action: {
                                selectLocation(location)
                            }) {
                                Image(systemName:"pin.fill") // Use your custom pin image name
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .clipShape(Circle())
                                    .foregroundColor(Color(red: 0.41, green: 0.53, blue: 0.76))
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    .onAppear{
                        locationViewModel.fetchLocations()
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
                                        .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                        .shadow(radius: 10)
                                        .font(.system(size: 25))
                                }

                                // Show Nearby Restaurants Button
                                Button(action: {
                                    showList = true
                                }) {
                                    Image(systemName: "list.bullet")
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .shadow(radius: 10)
                                        .font(.system(size: 25))
                                }
                            }
                            .padding(.trailing, 10)
                            .padding(.bottom, 20)
                        }
                    }
                }
                .padding(.top, 20)
            }

            if showList {
                LocationListView(showList: $showList, searchText: $searchText, showRestaurants: $showRestaurants)
                    .transition(.move(edge: .bottom))
            }
        }
    }

    func centerMapOnUserLocation() {
        if let location = locationManager.userLocation {
            region.center = location
        }
    }

    func selectLocation(_ location: Location) {
        searchText = location.name
        showList = true
        showRestaurants = location.restaurant
        selectedLocation = location
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
