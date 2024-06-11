import Foundation

class APIClient {
   static func fetchPlaces(for category: String, completion: @escaping ([Place]) -> Void) {
       let apiURL = URL(string: "https://api.example.com/places?category=\(category)")!
       let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
           guard let data = data else { return }
           do {
               let places = try JSONDecoder().decode([Place].self, from: data)
               DispatchQueue.main.async {
                   completion(places)
               }
           } catch {
               print(error)
           }
       }
       task.resume()
   }
}
