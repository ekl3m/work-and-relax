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
                // Sekcja profilu użytkownika
                VStack {
                    ZStack(alignment: .topTrailing) {
                        // Karta z profilem użytkownika
                        VStack {
                            if let photoUrl = userManager.user?.photo, let url = URL(string: photoUrl) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty:
                                        Color(.systemGray4)
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                            .overlay(
                                                ProgressView()
                                                    .progressViewStyle(CircularProgressViewStyle())
                                            )
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                            .shadow(radius: 10)
                                    case .failure:
                                        Color.gray
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                            .shadow(radius: 10)
                                            .overlay(
                                                VStack {
                                                    Image(systemName: "person.fill")
                                                        .frame(width: 100, height: 100)
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 90))
                                                        .padding(.top, 18)
                                                        .clipShape(Circle())
                                                }
                                            )
                                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            } else {
                                Color.gray
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                                    .overlay(
                                        VStack {
                                            Image(systemName: "person.fill")
                                                .frame(width: 100, height: 100)
                                                .foregroundColor(.white)
                                                .font(.system(size: 90))
                                                .padding(.top, 18)
                                                .clipShape(Circle())
                                        }
                                    )
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            }
                            
                            Text("\(userManager.user?.name ?? "") \(userManager.user?.surname ?? "Gość ")")
                                .font(.custom("WorkSans-SemiBold", size: 25))
                                .padding(.top, 10)
                        }
                        .padding()
                        .frame(width: 350, height: 230)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        
                        // Ikona edycji profilu
                        Button(action: {
                            showingProfileEdit.toggle()
                        }) {
                            Image(systemName: "square.and.pencil")
                                .padding(10)
                                .fontWeight(.bold)
                                .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                                .clipShape(Circle())
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                        }
                        .offset(x: -15, y: 15)
                        .fullScreenCover(isPresented: $showingProfileEdit) {
                            TestAnimation()
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 120)
                
                // Menu nawigacyjne
                VStack(spacing: 30) {
                    NavigationButton(icon: "person.2.fill", title: "ZNAJOMI") {
                        showingFriendsView.toggle()
                    }
                    .fullScreenCover(isPresented: $showingFriendsView) {
                        TestAnimation() // Replace with actual Friends view
                    }
                    
                    NavigationButton(icon: "bookmark.fill", title: "ZAPISANE") {
                        showingSavedView.toggle()
                    }
                    .fullScreenCover(isPresented: $showingSavedView) {
                        TestAnimation() // Replace with actual Saved view
                    }
                    
                    NavigationButton(icon: "gearshape.fill", title: "USTAWIENIA") {
                        showingSettingsView.toggle()
                    }
                    .fullScreenCover(isPresented: $showingSettingsView) {
                        TestAnimation() // Replace with actual Settings view
                    }
                    
                    NavigationButton(icon: "questionmark.circle.fill", title: "WSPARCIE") {
                        showingSupportView.toggle()
                    }
                    .fullScreenCover(isPresented: $showingSupportView) {
                        TestAnimation() // Replace with actual Support view
                    }
                    
                    NavigationButton(icon: "rectangle.portrait.and.arrow.right.fill", title: "WYLOGUJ SIĘ") {
                        showingLogoutConfirmation.toggle()
                    }
                }
                .padding(.top, 20)
                .padding(.leading, 20)
                
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
