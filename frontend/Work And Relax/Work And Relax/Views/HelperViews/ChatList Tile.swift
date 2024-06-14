import SwiftUI

struct ChatList_Tile: View {
    var user: ChatUser
    
    var body: some View {
        HStack {
            if let photoUrl = user.photo, let url = URL(string: photoUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        Color(.systemGray4)
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
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
                        Color.gray
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .overlay(
                                VStack {
                                    Image(systemName: "person.fill")
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.white)
                                        .font(.system(size: 60))
                                        .padding(.top, 18)
                                }
                            )
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Color.gray
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(
                        VStack {
                            Image(systemName: "person.fill")
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                                .font(.system(size: 60))
                                .padding(.top, 18)
                        }
                    )
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(user.name)
                        .font(.headline)
                    Text(user.surname)
                        .font(.headline)
                    if user.admin {
                        Text("(Admin)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
            
                Text("No co tam u ciebie?")
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
        .shadow(radius: 3, x: 2, y: 2)
        .frame(width: 400)
    }
}

struct ChatList_Tile_Previews: PreviewProvider {
    static var previews: some View {
        ChatList_Tile(user: ChatUser(name: "Adam", surname: "Mickiewicz", email: "adam@example.com", password: "password", verificationCode: 100123, id: 20, userplan: 20, friendlist: nil, verified: true, admin: true, banned: false, photo: "https://i.imgur.com/1GEOCbp.pn"))
            .previewLayout(.sizeThatFits)
    }
}
