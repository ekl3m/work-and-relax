//
//  Login-Register-Screen.swift
//  Work And Relax
//
//  Created by Eryk Klemencki on 26/05/2024.
//

import SwiftUI
import FontAwesome

struct Login_Register_Screen: View {
    var body: some View {
        VStack {
            Spacer()
            VStack{
                Text("\(String.fontAwesomeIcon(name: .userFriends))")
                    .font(.custom("FontAwesome5Free-Solid", size: 100))
//                Image("user-group-solid")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 100, height: 100)
//                    .foregroundColor(.red)
                Text("Zaloguj się lub zarejestruj się")
                    .font(.custom("LeagueGothic-Regular", size: 40))
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .background(
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 237/255, green: 237/255, blue: 237/255))
                    .frame(
                        width: UIScreen.main.bounds.width * 1 / 2 + 160,
                        height: UIScreen.main.bounds.height / 2 + 200
                    )
            }
        )
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Login_Register_Screen()
}
