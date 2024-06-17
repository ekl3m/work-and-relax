import SwiftUI

struct MenuScreen: View {
    @EnvironmentObject var userManager: UserManager
    @State private var showingFriendsView = false
    @State private var showingSavedView = false
    @State private var showingSettingsView = false
    @State private var showingSupportView = false
    @State private var showingLogoutConfirmation = false
    @State private var showingProfileEdit = false
    @State private var logoutDecided = false
    
    var body: some View {
        ZStack {
            // Górny gradientowy nagłówek
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.21, green: 0.33, blue: 0.56), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.57, green: 0.65, blue: 1), location: 0.49),
                    Gradient.Stop(color: .white, location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
                    Text("Mój profil")
                        .font(.custom("WorkSans-ExtraBold", size: 34))
                        .foregroundColor(.white)
                        .padding(.top, 50)
                    
                    Spacer()
                }
            )
            
            Rectangle()
                .foregroundColor(.white)
                .padding(.top, 230)
            
            VStack {
                ProfileView(showingProfileEdit: $showingProfileEdit)
                
                NavigationButtonsView(
                    showingFriendsView: $showingFriendsView,
                    showingSavedView: $showingSavedView,
                    showingSettingsView: $showingSettingsView,
                    showingSupportView: $showingSupportView,
                    showingLogoutConfirmation: $showingLogoutConfirmation
                )
                
                Spacer()
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .overlay(
            // Okno wylogowania na przyciemnionym tle
            Group {
                if showingLogoutConfirmation {
                    LogoutPrompt(isPresented: $showingLogoutConfirmation, logoutDecided: $logoutDecided)
                        .environmentObject(userManager)
                        .transition(.opacity)
                }
            }
        )
        .fullScreenCover(isPresented: $logoutDecided) {
            Login_Register_Screen()
                .environmentObject(userManager)
        }
    }
}

struct NavigationButton: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                HStack{
                    Image(systemName: icon)
                        .font(.headline)
                        .frame(width: 55, height: 55)
                        .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .zIndex(1)
                    
                    Text(title)
                        .font(.custom("WorkSans-SemiBold", size: 25))
                        .foregroundColor(.black)
                        .padding(.leading, 40)
                        .background(
                            Color(.systemGray6)
                                .frame(width: 500, height: 70)
                                .opacity(0.8)
                                .blur(radius: 30)
                                .shadow(radius: 1).opacity(0.2)
                        )
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
            .environmentObject(UserManager())
    }
}
