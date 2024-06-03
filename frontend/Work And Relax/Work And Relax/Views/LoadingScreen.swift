import SwiftUI

struct LoadingScreen: View {
    @State private var animate = false

    var body: some View {
        ZStack {
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
                    .offset(y: animate ? -UIScreen.main.bounds.height : 0) // Move text up off the screen
                    .animation(Animation.easeInOut(duration: 1.7).delay(1), value: animate)
                Text("RELAX")
                    .font(.custom("Lalezar-Regular", size: 80))
                    .foregroundColor(.white)
                    .padding(.top, -60)
                    .padding(.bottom, 90)
                    .offset(y: animate ? -UIScreen.main.bounds.height : 0) // Move text up off the screen
                    .animation(Animation.easeInOut(duration: 1.75).delay(1), value: animate)
                Spacer()
            }
            .zIndex(2) // Ensure the & and RELAX texts are above the ellipse

            VStack {
                Ellipse()
                    .fill(Color(red: 54/255, green: 85/255, blue: 143/255))
                    .frame(
                        width: animate ? UIScreen.main.bounds.width * 3 : UIScreen.main.bounds.width * 1.5,
                        height: animate ? UIScreen.main.bounds.height * 3 : UIScreen.main.bounds.height / 2 + 350
                    )
                    .padding(.bottom, animate ? 0 : -780)
                    .animation(Animation.easeInOut(duration: 2).delay(1), value: animate)
            }
            .zIndex(1) // Ensure the ellipse is above the WORK text but below & and RELAX
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.animate = false // do zmiany na true
                }
            }
        }
    }
}

#Preview {
    LoadingScreen()
}
