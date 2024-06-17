import SwiftUI

struct NavBar: View {
    @EnvironmentObject var userManager: UserManager
    @State private var selectedView: String = "Start"
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            // Wyświetl wybrany widok
            Group {
                if selectedView == "Start" {
                    HomeScreen()
                        .environmentObject(userManager)
                } else if selectedView == "Czat" {
                    ChatView()
                } else if selectedView == "Plan" {
                    TestAnimation()
                } else if selectedView == "Mapa" {
                    HomeView()
                } else if selectedView == "Menu" {
                    MenuScreen()
                        .environmentObject(userManager)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.top)
            .animation(.easeInOut, value: selectedView)
            
            Rectangle()
                .fill(Color.black)
                .frame(height: 1)
                .opacity(0.6)
            
            HStack(spacing: 0) {
                Spacer(minLength: 12)
                
                NavItem(icon: "house.fill", label: "Start", color: .white, selectedView: $selectedView, currentView: "Start", animation: animation)
                
                Spacer()
                
                NavItem(icon: "message.fill", label: "Czat", color: .white, selectedView: $selectedView, currentView: "Czat", animation: animation)
                
                Spacer()
                
                NavItem(icon: "calendar", label: "Plan", color: .white, selectedView: $selectedView, currentView: "Plan", animation: animation)
                
                Spacer()
                
                NavItem(icon: "map.fill", label: "Mapa", color: .white, selectedView: $selectedView, currentView: "Mapa", animation: animation)
                
                Spacer()
                
                NavItem(icon: "slider.horizontal.3", label: "Menu", color: .white, selectedView: $selectedView, currentView: "Menu", animation: animation)
                
                Spacer(minLength: 12)
            }
            .frame(height: 92)
            .background(Color(red: 0.21, green: 0.33, blue: 0.56))
            .shadow(radius: 5)
            .safeAreaInset(edge: .bottom) { Color.clear.frame(height: 10) } // Dodajemy bezpieczny obszar dolny
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct NavItem: View {
    let icon: String
    let label: String
    let color: Color
    @Binding var selectedView: String
    let currentView: String
    var animation: Namespace.ID
    
    var body: some View {
        VStack(spacing: 4) {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(color)
                    .frame(width: 74, height: 24)
                
                Text(label)
                    .font(.system(size: 10))
                    .foregroundColor(color)
                    .padding(.top, 2)
                
                if selectedView == currentView {
                    Rectangle()
                        .fill(color)
                        .frame(height: 2)
                        .padding(.top, 4)
                        .matchedGeometryEffect(id: "underline", in: animation)
                }
            }
            .onTapGesture {
                if selectedView != currentView {
                    withAnimation(.easeInOut) {
                        selectedView = currentView
                    }
                }
            }
            .frame(width: 74, height: 58)
            .padding(.bottom, 20)
            .padding(.top)
        }
    }
}

#Preview {
    NavBar()
        .environmentObject(UserManager())
}
