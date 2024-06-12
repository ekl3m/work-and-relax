import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Czat")
                        .font(.custom("WorkSans-ExtraBold", size: 34))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                    Spacer()
                }
                .padding()
                .padding(.top, -18)
                
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.systemGray3))
                        TextField("Szukaj", text: .constant(""))
                            .frame(width: 270)
                    }
                    .padding(.vertical, 8)
                    .padding(.leading, 30)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .padding(.leading, 25)
                            .foregroundColor(Color(.systemGray6))
                            .shadow(radius: 3, x: 2, y: 2)
                    )
                    Spacer(minLength: 20)
                    Button(action: {
                        // Action to show messages
                    }) {
                        Image(systemName: "plus.message.fill")
                            .font(.system(size: 20))
                            .padding(.all, 8)
                            .background(Color(.systemGray6))
                            .foregroundColor(Color(red: 54 / 255, green: 85 / 255, blue: 143 / 255))
                            .cornerRadius(8)
                            .shadow(radius: 3, x: 2, y: 2)
                    }
                }
                .padding([.leading, .trailing, .bottom])
                .padding(.top, 20)
                
                List(viewModel.users) { user in
                    ChatList_Tile(user: user)
                }
            }
            .navigationBarHidden(true)
            .background(
                ZStack {
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
                    
                    Rectangle()
                        .frame(width: 600, height: 800)
                        .foregroundColor(.white)
                        .cornerRadius(70)
                        .padding(.leading, 170)
                        .padding(.bottom, -140)
                }
            )
        }
        .onAppear {
                viewModel.fetchUsers()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
