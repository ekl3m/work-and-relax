import SwiftUI

struct LoadingScreen: View {
    @State private var animate = false
    @State private var showLoginScreen = false

    var body: some View {
        ZStack {
            if showLoginScreen {
                Login_Register_Screen()
                    .transition(.opacity)
                    .zIndex(1)
            } else {
                VStack {
                    Spacer()
                    Text("WORK")
                        .font(.custom("Lalezar-Regular", size: 80))
                        .foregroundColor(.black)
                        .padding(.bottom, 270)
                        .padding(.top, 150)
                    Spacer()
                }
                .zIndex(0)
                
                VStack {
                    Spacer()
                    Text("&")
                        .font(.custom("Lalezar-Regular", size: 80))
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                        .padding(.top, 250)
                        .offset(y: animate ? -UIScreen.main.bounds.height : 0)
                        .animation(Animation.easeInOut(duration: 1.7).delay(1), value: animate)
                    Text("RELAX")
                        .font(.custom("Lalezar-Regular", size: 80))
                        .foregroundColor(.white)
                        .padding(.top, -60)
                        .padding(.bottom, 90)
                        .offset(y: animate ? -UIScreen.main.bounds.height : 0)
                        .animation(Animation.easeInOut(duration: 1.75).delay(1), value: animate)
                    Spacer()
                }
                .zIndex(2)
                
                VStack {
                    Ellipse()
                        .fill(Color(red: 54 / 255, green: 85 / 255, blue: 143 / 255))
                        .frame(
                            width: animate ? UIScreen.main.bounds.width * 3 : UIScreen.main.bounds.width * 1.5,
                            height: animate ? UIScreen.main.bounds.height * 3 : UIScreen.main.bounds.height / 2 + 350
                        )
                        .padding(.bottom, animate ? 0 : -780)
                        .animation(Animation.easeInOut(duration: 2).delay(1), value: animate)
                }
                .zIndex(1)
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear {
            withAnimation {
                self.animate = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.showLoginScreen = true
                }
            }
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
