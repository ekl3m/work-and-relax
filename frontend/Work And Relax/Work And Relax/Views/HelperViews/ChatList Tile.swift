//
//  ChatList Tile.swift
//  Work And Relax
//
//  Created by Eryk Klemencki on 12/06/2024.
//

import SwiftUI

struct ChatList_Tile: View {
    var user: UserProfile
    
    var body: some View {
        HStack {
            Image(user.photo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
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
        ChatList_Tile(user: UserProfile(name: "Adam", surname: "Mickiewicz", email: "adam@example.com", password: "password", verificationCode: "100123", id: 20, userplan: 20, friendlist: nil, verified: true, admin: true, banned: false, photo: "profile1"))
            .previewLayout(.sizeThatFits)
    }
}

