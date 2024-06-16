import SwiftUI

struct FriendlistView: View {
    @EnvironmentObject var userManager: UserManager
    @Binding var isPresented: Bool
    
    var body: some View {
        Text("\(userManager.user?.friendlist ?? [])")
    }
}

#Preview {
    FriendlistView(isPresented: .constant(true))
        .environmentObject(UserManager())
}
