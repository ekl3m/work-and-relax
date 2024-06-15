import Foundation

class LocationViewModel: ObservableObject {
    @Published var locations: [Location] = []

    func fetchLocations() {
        let url = URL(string: "http://\(Config.baseURL)/api/v1/location/all?key=\(Config.apiKey)")!

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
