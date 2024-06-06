import SwiftUI

struct NavBar: View {
    var body: some View {
        ZStack {
            VStack (spacing: 0) {
                Spacer()
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 1) // Wysokość cienkiej kreski
                    .opacity(0.6)
                HStack(spacing: 0) {
                    Spacer(minLength: 12)
                    
                    NavItem(icon: "house.fill", label: "Start", color: .white, destination: AnyView(HomeScreen()))
                    
                    Spacer()
                    
                    NavItem(icon: "message.fill", label: "Czat", color: .white, destination: AnyView(LoadingScreen()))
                    
                    Spacer()
                    
                    NavItem(icon: "calendar", label: "Plan", color: .white, destination: AnyView(LoadingScreen()))
                    
                    Spacer()
                    
                    NavItem(icon: "map.fill", label: "Mapa", color: .white, destination: AnyView(LoadingScreen()))
                    
                    Spacer()
                    
                    NavItem(icon: "slider.horizontal.3", label: "Menu", color: .white, destination: AnyView(LoadingScreen()))
                    
                    Spacer(minLength: 12)
                }
                .frame(height: 92)
                .background(Color(red: 0.21, green: 0.33, blue: 0.56))
                .shadow(radius: 5)
                .padding(.bottom, 30)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 20)
    }
}

struct NavItem: View {
    let icon: String
    let label: String
    let color: Color
    let destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack(spacing: 4) {
                GeometryReader { geometry in
                    VStack {
                        Image(systemName: icon)
                            .font(.system(size: 24))
                            .foregroundColor(color)
                            .frame(width: geometry.size.width, height: geometry.size.width) // Ikona w równym kwadracie
                        Text(label)
                            .font(.system(size: 10))
                            .foregroundColor(color)
                            .fixedSize()
                            .padding(.top, -20) // Dodanie odstępu pomiędzy ikoną a tekstem
                    }
                    .frame(height: geometry.size.height) // Wycentrowanie zawartości pionowo
                }
            }
            .frame(width: 74, height: 58) // Upewnienie się, że każda kolumna ma stały rozmiar
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    NavBar()
}
