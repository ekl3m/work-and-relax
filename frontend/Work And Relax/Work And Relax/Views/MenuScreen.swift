import SwiftUI

struct MenuScreen: View {
    @EnvironmentObject var userManager: UserManager
    
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
                            // Akcja edycji profilu
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
                    }
                }
                .padding(.horizontal)
                .padding(.top, 120)
                
                // Menu nawigacyjne
                VStack(spacing: 20) {
                    NavigationButton(icon: "person.2.fill", title: "ZNAJOMI")
                    NavigationButton(icon: "bookmark.fill", title: "ZAPISANE")
                    NavigationButton(icon: "gearshape.fill", title: "USTAWIENIA")
                    NavigationButton(icon: "questionmark.circle.fill", title: "WSPARCIE")
                    NavigationButton(icon: "arrowshape.turn.up.left.fill", title: "WYLOGUJ SIĘ")
                }
                .padding(.top, 20)
                
                Spacer()
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct NavigationButton: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title)
                .frame(width: 44, height: 44)
                .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                .foregroundColor(.white)
                .clipShape(Circle())
            
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
            .environmentObject(UserManager())
    }
}
