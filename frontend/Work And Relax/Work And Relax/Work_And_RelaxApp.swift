//
//  Work_And_RelaxApp.swift
//  Work And Relax
//
//  Created by Eryk Klemencki on 25/05/2024.
//

import SwiftUI

@main
struct Work_And_RelaxApp: App {
    let persistenceController = PersistenceController.shared
 
    var body: some Scene {
        WindowGroup {
            LoadingScreen()
                .environmentObject(UserManager.shared)
        }
    }
}
