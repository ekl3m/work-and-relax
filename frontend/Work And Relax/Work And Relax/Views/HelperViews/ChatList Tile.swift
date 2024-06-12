import SwiftUI

struct ChatList_Tile: View {
    var user: UserProfile
    
    var body: some View {
        HStack {
            if let url = URL(string: user.photo) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        Color.gray
                            .frame(height: 200)
                            .overlay(
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            )
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                    case .failure:
                        Color.red
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .overlay(
                                VStack {
                                    Image(systemName: "exclamationmark.triangle")
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                }
                            )
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Text("Nieprawidłowy URL: \(user.photo)")
                    .font(.caption)
                    .foregroundColor(.red)
                Color.red
                    .frame(height: 200)
                    .overlay(
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    )
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(user.name)
                        .font(.headline)
                    if (user.admin) {
                        Text("(Admin)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Text("Dziękuję za pomoc")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            
                Text("czw. 20:07")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ChatList_Tile_Previews: PreviewProvider {
    static var previews: some View {
        ChatList_Tile(user: UserProfile(name: "Adam", surname: "Mickiewicz", email: "adam@example.com", password: "password", verificationCode: 100123, id: 20, userplan: 20, friendlist: nil, verified: true, admin: true, banned: false, photo: "https://i.imgur.com/1GEOCbp.png"))
            .previewLayout(.sizeThatFits)
    }
}

