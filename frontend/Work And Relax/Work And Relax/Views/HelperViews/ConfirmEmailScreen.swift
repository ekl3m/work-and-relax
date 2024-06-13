import SwiftUI

struct ConfirmEmailScreen: View {
    @State var stopShowingConfirmView: Bool = false

    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: -15) {
                Image(systemName: "envelope.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(red: 54/255, green: 85/255, blue: 143/255))
                    .padding(.vertical, 10)
                
                Text("Potwierdź swój email")
                    .font(.custom("LeagueGothic-Regular", size: 40))
                    .foregroundColor(Color(red: 54/255, green: 85/255, blue: 143/255))
            }
            
            Spacer()
            
            Text("Na twój adres mailowy został wysłany mail z kodem weryfikacyjnym. Po przejściu do aplikacji w ustawieniach konta możesz wpisać ten kod, aby potwiedzić swój adres email.")
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 54/255, green: 85/255, blue: 143/255))
                .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                // Akcja rejestracji
                stopShowingConfirmView = true
            }) {
                Text("Przejdź do aplikacji")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: UIScreen.main.bounds.width * 1 / 2 + 80)
                    .padding()
                    .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                    .cornerRadius(25)
                    .shadow(radius: 3, x: 2, y: 2)
            }
            .padding(.bottom)
            
            Spacer()
        }
        .padding()
        .frame(height: UIScreen.main.bounds.height / 2 + 150)
        .background(
            VStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color(red: 237 / 255, green: 237 / 255, blue: 237 / 255))
                    .frame(
                        width: UIScreen.main.bounds.width * 1 / 2 + 160,
                        height: UIScreen.main.bounds.height / 2 + 150
                    )
            }
        )
        .cornerRadius(20)
        .padding(.horizontal, 16)
        .fullScreenCover(isPresented: $stopShowingConfirmView) {
            // Navigate to your main screen on successful login
            NavBar() // Replace with your main screen
        }
    }
}

struct ConfirmEmailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmEmailScreen()
    }
}

