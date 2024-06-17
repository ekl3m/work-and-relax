import SwiftUI
import Combine

struct Friend: Identifiable {
    let id: Int
    let name: String
    let avatarURL: URL
}

struct VerifyUserResponse: Codable {
    let success: Bool
    let message: String?
}

class UserManager: ObservableObject {
    @Published var user: UserProfile? = nil
    @Published var isLoggedIn: Bool = false
    @Published var isGuest: Bool = false
    @Published var friends: [Friend] = []
    @Published var savedEvents: [Int] = []
    @Published var savedEventObjects: [Event] = []
    
    static let shared = UserManager()
    
    private let eventViewModel = EventViewModel()
    
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
        fetchSavedEvents()
    }
    
    func logOut() {
        self.user = nil
        self.isGuest = false
        self.isLoggedIn = false
        self.friends = []
        self.savedEvents = []
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
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Received JSON: \(jsonString)")
                }
            }
        }.resume()
    }

    
    func fetchSavedEvents() {
        eventViewModel.fetchEvents()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.savedEventObjects = self.eventViewModel.events.filter {
                self.savedEvents.contains(Int($0.id))
            }
        }
    }
    
    func verifyUser(completion: @escaping (Bool, String?) -> Void) {
        guard let user = user else {
            completion(false, "No user is logged in")
            return
        }

        let url = URL(string: "http://\(Config.baseURL)/api/v1/userprofile/edit/\(user.id)?key=\(Config.apiKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(false, error.localizedDescription)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(false, "No data received")
                }
                return
            }
            
            do {
                let response = try JSONDecoder().decode(VerifyUserResponse.self, from: data)
                DispatchQueue.main.async {
                    if response.success {
                        let updatedUser = UserProfile(
                            name: user.name,
                            surname: user.surname,
                            email: user.email,
                            password: user.password,
                            verificationCode: user.verificationCode,
                            id: user.id,
                            userplan: user.userplan,
                            friendlist: user.friendlist,
                            verified: true,  // Update verified to true
                            admin: user.admin,
                            banned: user.banned,
                            photo: user.photo
                        )
                        self.user = updatedUser
                        completion(true, nil)
                    } else {
                        completion(false, response.message ?? "Verification failed")
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(false, "JSON decoding error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }

}
