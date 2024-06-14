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
}

func login(email: String, password: String, userManager: UserManager, completion: @escaping (Bool, String?) -> Void) {
    let baseURL = "http://20.107.170.217:8080/api/v1/userprofile/byEmail?key=yK9v2TA1GZkq3dTbdfR_1v1NCxE_H9oK4i5H0QKslHg&email="
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
