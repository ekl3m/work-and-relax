import SwiftUI

struct LogoutPrompt: View {
    @EnvironmentObject var userManager: UserManager
    @Binding var isPresented: Bool
    @Binding var logoutDecided: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black).opacity(0.4)
                .frame(height: 1000)
            
            Rectangle()
                .frame(width: 350, height: 200)
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(radius: 5)
            
            VStack {
                Spacer(minLength: 430)
                
                Text("Czy na pewno chcesz się wylogować?")
                    .font(.custom("WorkSans-SemiBold", size: 25))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    Spacer(minLength: 80)
                    NavigationButton2(title: "Powrót", color: Color(.systemGray)) {
                        isPresented = false
                    }
                    
                    Spacer()
                    
                    NavigationButton2(title: "Wyloguj", color: Color(red: 54/255, green: 85/255, blue: 143/255)) {
                        userManager.logOut()
                        logoutDecided = true
                        isPresented = false
                    }
                    
                    Spacer(minLength: 90)
                }
                .padding(.leading, -20)
                
                Spacer(minLength: 440)
            }
        }
    }
}

struct NavigationButton2: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("WorkSans-SemiBold", size: 20))
                .foregroundColor(.white)
                .padding(.leading, 40)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 120, height: 50)
                        .offset(x: 20)
                        .foregroundColor(color)
                )
        }
    }
}

#Preview {
    LogoutPrompt(isPresented: .constant(true), logoutDecided: .constant(false))
        .environmentObject(UserManager())
}
