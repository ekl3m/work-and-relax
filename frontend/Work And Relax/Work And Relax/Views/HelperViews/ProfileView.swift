import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userManager: UserManager
    @Binding var showingProfileEdit: Bool
    
    var body: some View {
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
                    
                    if userManager.user?.admin == true {
                        Text("(Admin)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom, -25)
                    }
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
                    
                    if userManager.user?.verified != true {
                        if userManager.isGuest != true {
                            Circle()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.red)
                                .offset(x: -18, y: -14)
                                .shadow(radius: 3)
                        }
                    }
                }
                .offset(x: -15, y: 15)
                .fullScreenCover(isPresented: $showingProfileEdit) {
                    TestAnimation()
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 120)
    }
}
