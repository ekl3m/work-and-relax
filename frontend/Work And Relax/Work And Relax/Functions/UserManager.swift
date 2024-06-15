import SwiftUI
import Combine

class UserManager: ObservableObject {
    @Published var user: UserProfile? = nil
    @Published var isLoggedIn: Bool = false
    @Published var isGuest: Bool = false
    
    static let shared = UserManager()
    
    // Metody do logowania, wylogowania, etc.
    
    func logIn(_ user: UserProfile) {
        self.user = user
        self.isLoggedIn = true
        
        if (user.id == -2) {
            self.isGuest = true
        }
    }
    
    func logOut() {
        self.user = nil
        self.isLoggedIn = false
    }
}
