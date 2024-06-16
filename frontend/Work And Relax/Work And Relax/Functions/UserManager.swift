import SwiftUI
import Combine

struct Friend: Identifiable {
    let id: Int
    let name: String
    let avatarURL: URL
}

class UserManager: ObservableObject {
    @Published var user: UserProfile? = nil
    @Published var isLoggedIn: Bool = false
    @Published var isGuest: Bool = false
    @Published var friends: [Friend] = []
    
    static let shared = UserManager()
    
    // Metody do logowania, wylogowania, etc.
    
    func logIn(_ user: UserProfile) {
        self.user = user
        self.isLoggedIn = true
        
        if (user.id == -2) {
            print("Guest logged in.")
            self.isGuest = true
        } else {
            self.isGuest = false
        }
        
        fetchFriends()
    }
    
    func logOut() {
        self.user = nil
        self.isGuest = false
        self.isLoggedIn = false
        self.friends = []
    }
    
    func fetchFriends() {
        let baseURL = "http://\(Config.baseURL)/api/v1/userprofile/all?key=\(Config.apiKey)"
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let fetchedUsers = try JSONDecoder().decode([UserProfile].self, from: data)
                
                DispatchQueue.main.async {
                    if let friendlist = self.user?.friendlist {
                        self.friends = fetchedUsers
                            .filter { friendlist.contains($0.id) }
                            .map { user in
                                Friend(
                                    id: user.id,
                                    name: "\(user.name) \(user.surname)",
                                    avatarURL: URL(string: user.photo ?? "")!
                                )
                            }
                    }
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
