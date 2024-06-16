import SwiftUI

struct FriendlistView: View {
    @EnvironmentObject var userManager: UserManager
    @Binding var isPresented: Bool
    @State private var searchText : String = ""
    
    var body: some View {
        ZStack() {
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
                    HStack {
                        Button(action: {
                            isPresented = false
                        }) {
                            Image(systemName: "arrowshape.left.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .padding(.top, 8)
                        }
                        .padding(.leading, 60)
                        
                        Spacer()
                        
                        Text("Znajomi")
                            .font(.custom("WorkSans-ExtraBold", size: 34))
                            .foregroundColor(.white)
                            .padding(.top, 5)
                            .padding(.leading, -90)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            )
            
            Rectangle()
                .frame(width: 500)
                .offset(y: 200)
                .foregroundColor(.white)
            
            Rectangle()
                .foregroundColor(.white)
                .padding(.top, 70)
            
            SearchBar2(searchText: $searchText)
                .padding(.horizontal)
                .padding(.bottom, 620)
            
            ScrollView {
                Spacer().frame(height: 20)
                ForEach(userManager.friends) { friend in
                    HStack {
                        AsyncImage(url: friend.avatarURL) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .padding(.leading, 15)
                        
                        Text(friend.name)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .padding(.leading, 30)
                        
                        Spacer()
                        
                    }
                    .background(
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 120)
                            .foregroundColor(Color(.systemGray6))
                    )
                    .padding(.bottom, 40)
                }
            }
            .refreshable {
                userManager.fetchFriends()
            }
            .frame(width: UIScreen.main.bounds.width, height: 800)
            .padding(.bottom, -290)
        }
        .onAppear {
            userManager.fetchFriends()
        }
    }
}

struct SearchBar2: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .frame(maxWidth: 380)
                .shadow(radius: 2, x: 3, y: 2)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 16)
                    }
                )
        }
        .padding(.top, 10)
    }
}

#Preview {
    FriendlistView(isPresented: .constant(true))
        .environmentObject(UserManager())
}
