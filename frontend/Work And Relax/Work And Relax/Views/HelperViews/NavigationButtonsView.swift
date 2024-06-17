import SwiftUI

struct NavigationButtonsView: View {
    @Binding var showingFriendsView: Bool
    @Binding var showingSavedView: Bool
    @Binding var showingSettingsView: Bool
    @Binding var showingSupportView: Bool
    @Binding var showingLogoutConfirmation: Bool
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack(spacing: 30) {
            NavigationButton(icon: "person.2.fill", title: "ZNAJOMI") {
                showingFriendsView.toggle()
            }
            .fullScreenCover(isPresented: $showingFriendsView) {
                FriendlistView(isPresented: $showingFriendsView)
                    .environmentObject(userManager)
            }
            
            NavigationButton(icon: "bookmark.fill", title: "ZAPISANE") {
                showingSavedView.toggle()
            }
            .fullScreenCover(isPresented: $showingSavedView) {
                SavedEvents(isPresented: $showingSavedView)
                    .environmentObject(userManager)
            }
            
            NavigationButton(icon: "gearshape.fill", title: "USTAWIENIA") {
                showingSettingsView.toggle()
            }
            .fullScreenCover(isPresented: $showingSettingsView) {
                TestAnimation() // Replace with actual Settings view
            }
            
            NavigationButton(icon: "questionmark.circle.fill", title: "WSPARCIE") {
                showingSupportView.toggle()
            }
            .fullScreenCover(isPresented: $showingSupportView) {
                TestAnimation() // Replace with actual Support view
            }
            
            NavigationButton(icon: "rectangle.portrait.and.arrow.right.fill", title: "WYLOGUJ SIĘ") {
                showingLogoutConfirmation.toggle()
            }
        }
        .padding(.top, 20)
        .padding(.leading, 20)
    }
}
