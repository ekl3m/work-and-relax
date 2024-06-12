import Foundation

class LocationViewModel: ObservableObject {
    @Published var locations: [Location] = []

    func fetchLocations() {
        let url = URL(string: "http://20.107.170.217:8080/api/v1/location/all?key=yK9v2TA1GZkq3dTbdfR_1v1NCxE_H9oK4i5H0QKslHg")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching locations: \(error)")
                DispatchQueue.main.async {
                    self.locations = []
                }
                return
            }

            guard let data = data else {
                print("No data received")
                DispatchQueue.main.async {
                    self.locations = []
                }
                return
            }

            do {
                let decodedLocations = try JSONDecoder().decode([Location].self, from: data)
                DispatchQueue.main.async {
                    print("Fetched locations: \(decodedLocations)")
                    self.locations = decodedLocations
                }
            } catch {
                print("Error decoding locations: \(error)")
                DispatchQueue.main.async {
                    self.locations = []
                }
            }
        }.resume()
    }
}
