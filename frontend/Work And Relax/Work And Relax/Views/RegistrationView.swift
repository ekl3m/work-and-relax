import SwiftUI

struct RegistrationView: View {
    @Binding var showingRegistrationView: Bool
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showError: Bool = false

    var body: some View {
        VStack {
            VStack(spacing: -15) {
                Image(systemName: "person.fill.badge.plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(red: 54/255, green: 85/255, blue: 143/255))
                    .padding(.vertical, 10)
                
                Text("Zarejestruj się")
                    .font(.custom("LeagueGothic-Regular", size: 40))
                    .foregroundColor(Color(red: 54/255, green: 85/255, blue: 143/255))
            }
            .padding(.bottom, 15)
            
            HStack {
                TextField("imię", text: $firstName)
                    .padding(.leading, 30)
                    .foregroundColor(showError ? Color.red : Color.black)
                    .onTapGesture {
                        showError = false
                    }
            }
            .frame(height: 50)
            .frame(width: UIScreen.main.bounds.width * 1 / 2 + 105)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 3, x: 2, y: 2)
            .padding(.horizontal, 30)
            
            Spacer(minLength: 20)
            
            HStack {
                TextField("nazwisko", text: $lastName)
                    .padding(.leading, 30)
                    .foregroundColor(showError ? Color.red : Color.black)
                    .onTapGesture {
                        showError = false
                    }
            }
            .frame(height: 50)
            .frame(width: UIScreen.main.bounds.width * 1 / 2 + 105)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 3, x: 2, y: 2)
            .padding(.horizontal, 30)
            
            Spacer(minLength: 20)
            
            HStack {
                TextField("email", text: $email)
                    .padding(.leading, 30)
                    .foregroundColor(showError ? Color.red : Color.black)
                    .onTapGesture {
                        showError = false
                    }
            }
            .frame(height: 50)
            .frame(width: UIScreen.main.bounds.width * 1 / 2 + 105)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 3, x: 2, y: 2)
            .padding(.horizontal, 30)
            
            Spacer(minLength: 20)
            
            HStack {
                SecureField("hasło", text: $password)
                    .padding(.leading, 30)
                    .foregroundColor(showError ? Color.red : Color.black)
                    .onTapGesture {
                        showError = false
                    }
            }
            .frame(height: 50)
            .frame(width: UIScreen.main.bounds.width * 1 / 2 + 105)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 3, x: 2, y: 2)
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            
            Spacer(minLength: 20)
            
            Button(action: {
                // Akcja rejestracji
                print("User registered with First Name: \(firstName), Last Name: \(lastName), Email: \(email)")
            }) {
                Text("Zarejestruj się")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: UIScreen.main.bounds.width * 1 / 2 + 80)
                    .padding()
                    .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                    .cornerRadius(25)
                    .shadow(radius: 3, x: 2, y: 2)
            }
            .padding(.bottom, 5)
            
            Button(action: {
                // Handle register action
                withAnimation {
                    showingRegistrationView = false
                }
            }) {
                Text("Powrót")
                    .font(.headline)
                    .foregroundColor(Color(red: 54/255, green: 85/255, blue: 143/255))
                    .frame(maxWidth: UIScreen.main.bounds.width * 1 / 2 + 80)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .frame(maxWidth: UIScreen.main.bounds.width * 1 / 2 + 110)
                            .background(.clear)
                            .foregroundColor(Color(red: 54/255, green: 85/255, blue: 143/255))
                            .shadow(radius: 2, x: 2, y: 2)
                    )
                    .shadow(radius: 2, x: 2, y: 2)
            }
            .padding(.bottom, 20)
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
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(showingRegistrationView: .constant(true))
    }
}

