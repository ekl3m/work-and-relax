import SwiftUI

struct UserProfile: Codable, Identifiable {
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
    
    // Domyślna wartość dla profilu gościa
    static let guest = UserProfile(
        name: "Gość",
        surname: "",
        email: "",
        password: "",
        verificationCode: 0,
        id: -2,
        userplan: 0,
        friendlist: nil,
        verified: false,
        admin: false,
        banned: false,
        photo: nil
    )
}

func login(email: String, password: String, userManager: UserManager, completion: @escaping (Bool, String?) -> Void) {
    let baseURL = "http://\(Config.baseURL)/api/v1/userprofile/byEmail?key=\(Config.apiKey)&email="
    guard let url = URL(string: baseURL + email) else {
        print("Invalid URL")
        return
    }

    print("Requesting URL: \(url)")  // Debugging line

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Network error: \(error.localizedDescription)")
            DispatchQueue.main.async {
                completion(false, "Network error")
            }
            return
        }

        guard let data = data else {
            print("No data received")
            DispatchQueue.main.async {
                completion(false, "No data received")
            }
            return
        }

        do {
            // Print raw data for debugging
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received raw JSON: \(jsonString)")
            }

            let user = try JSONDecoder().decode(UserProfile.self, from: data)
            let message = "Fetched user: \(user.email)"
            print("Fetched user: \(user)")  // Debugging line

            if user.password == password {
                DispatchQueue.main.async {
                    userManager.logIn(user)
                    completion(true, message)
                }
            } else {
                DispatchQueue.main.async {
                    completion(false, "Incorrect password")
                }
            }
        } catch {
            print("JSON error: \(error.localizedDescription)")
            DispatchQueue.main.async {
                completion(false, "JSON parsing error: \(error.localizedDescription)")
            }
        }
    }.resume()
}
