//
//  HomeScreen.swift
//  Work And Relax
//
//  Created by Eryk Klemencki on 06/06/2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            NavBar()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 20)
        .background(
          LinearGradient(
            stops: [
              Gradient.Stop(color: Color(red: 0.21, green: 0.33, blue: 0.56), location: 0.00),
              Gradient.Stop(color: Color(red: 0.57, green: 0.65, blue: 1), location: 0.49),
              Gradient.Stop(color: .white, location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
          )
        )
        .cornerRadius(35)
    }
}

#Preview {
    HomeScreen()
}
