import SwiftUI
import Combine

struct ChatUser: Codable, Identifiable {
    let name: String
    let surname: String
    let email: String
    let password: String
    let verificationCode: Int
    let id: Int
    let userplan: Int
    let friendlist: String?
    let verified: Bool
    let admin: Bool
    let banned: Bool
    let photo: String?
}

class ChatViewModel: ObservableObject {
    @Published var users: [ChatUser] = []
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        let baseURL = "http://20.107.170.217:8080/api/v1/userprofile/all?key=yK9v2TA1GZkq3dTbdfR_1v1NCxE_H9oK4i5H0QKslHg"
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }

        print("Requesting URL: \(url)")  // Debugging line

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                // Print raw data for debugging
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Received raw JSON: \(jsonString)")
                }

                let users = try JSONDecoder().decode([ChatUser].self, from: data)
                print("Fetched users: \(users)")  // Debugging line

                DispatchQueue.main.async {
                    self?.users = users
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
