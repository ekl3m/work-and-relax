import SwiftUI
import MapKit

struct LocationView: View {
    let location: Location
    var onSelect: (Color, Color) -> Void
    @State private var dominantColor: Color = .gray
    @State private var textColor: Color = .white

    var body: some View {
        VStack(alignment: .leading) {
            if let url = URL(string: location.photo) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        Color.gray
                            .frame(height: 200)
                            .overlay(
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            )
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .shadow(radius: 5)
                            .onAppear {
                                image.getDominantColor { color in
                                    dominantColor = color
                                    textColor = color.contrastingColor()
                                }
                            }
                    case .failure:
                        Color.red
                            .frame(height: 200)
                            .overlay(
                                VStack {
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                    Text("Nie udało się załadować obrazu")
                                        .foregroundColor(.white)
                                }
                            )
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Text("Nieprawidłowy URL: \(location.photo)")
                    .font(.caption)
                    .foregroundColor(.red)
                Color.red
                    .frame(height: 200)
                    .overlay(
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    )
            }

            HStack {
                Text(location.name)
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .padding(.top, 5)
                    .foregroundColor(textColor)
                
                Spacer()
                
                Button(action: {
                    navigateToLocation(location)
                }) {
                    HStack {
                        Text("Nawiguj")
                        Image(systemName: "arrow.right.circle")
                    }
                    .foregroundColor(textColor)
                    .padding(10)
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(20)
                }
                .padding(.top,10)
            }
        }
        .padding()
        .background(dominantColor)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        .contentShape(Rectangle())  // Ensure the entire area is tappable
        .onTapGesture {
            onSelect(dominantColor, textColor)
        }
        .onAppear {
            print("LocationView appeared for location \(location.id)")
        }
        .onDisappear {
            print("LocationView disappeared for location \(location.id)")
        }
    }

    func navigateToLocation(_ location: Location) {
        let coordinate = CLLocationCoordinate2D(latitude: location.location_X, longitude: location.location_Y)
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = location.name
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: Location(id: 1, name: "Sample Location", location_X: 0.0, location_Y: 0.0, photo: "https://i.imgur.com/fk3bVFl.jpg", restaurant: true), onSelect: { _, _ in })
    }
}
