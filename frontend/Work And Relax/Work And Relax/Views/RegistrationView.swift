import SwiftUI

struct NewUserProfile: Codable {
    let name: String
    let surname: String
    let email: String
    let password: String
    let verificationCode: Int
    let userplan: Int
    let friendlist: String?
    let verified: Bool
    let admin: Bool
    let banned: Bool
    let photo: String?
}


struct RegistrationView: View {
    @Binding var showingRegistrationView: Bool
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var firstNameHasError: Bool = false
    @State private var lastNameHasError: Bool = false
    @State private var emailHasError: Bool = false
    @State private var passwordHasError: Bool = false
    @State private var registerSuccess: Bool = false

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
                    .foregroundColor(firstNameHasError ? Color.red : Color.black)
                    .onTapGesture {
                        firstNameHasError = false
                    }
            }
            .frame(height: 50)
            .frame(width: UIScreen.main.bounds.width * 1 / 2 + 105)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: firstNameHasError ? Color.red : Color.gray, radius: 3, x: 2, y: 2)
            .padding(.horizontal, 30)
            
            Spacer(minLength: 20)
            
            HStack {
                TextField("nazwisko", text: $lastName)
                    .padding(.leading, 30)
                    .foregroundColor(lastNameHasError ? Color.red : Color.black)
                    .onTapGesture {
                        lastNameHasError = false
                    }
            }
            .frame(height: 50)
            .frame(width: UIScreen.main.bounds.width * 1 / 2 + 105)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: lastNameHasError ? Color.red : Color.gray, radius: 3, x: 2, y: 2)
            .padding(.horizontal, 30)
            
            Spacer(minLength: 20)
            
            HStack {
                TextField("email", text: $email)
                    .padding(.leading, 30)
                    .foregroundColor(emailHasError ? Color.red : Color.black)
                    .onTapGesture {
                        emailHasError = false
                    }
            }
            .frame(height: 50)
            .frame(width: UIScreen.main.bounds.width * 1 / 2 + 105)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: emailHasError ? Color.red : Color.gray, radius: 3, x: 2, y: 2)
            .padding(.horizontal, 30)
            .autocapitalization(.none)
            
            Spacer(minLength: 20)
            
            HStack {
                SecureField("hasło", text: $password)
                    .padding(.leading, 30)
                    .foregroundColor(passwordHasError ? Color.red : Color.black)
                    .onTapGesture {
                        passwordHasError = false
                    }
            }
            .frame(height: 50)
            .frame(width: UIScreen.main.bounds.width * 1 / 2 + 105)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: passwordHasError ? Color.red : Color.gray, radius: 3, x: 2, y: 2)
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            
            Spacer(minLength: 20)
            
            Button(action: {
                // Akcja rejestracji
                
                if validateFields() {
                    let newUser = NewUserProfile(
                        name: firstName,
                        surname: lastName,
                        email: email,
                        password: password,
                        verificationCode: -1,
                        userplan: 3,
                        friendlist: nil,
                        verified: false,
                        admin: false,
                        banned: false,
                        photo: nil
                    )
                    
                    register(user: newUser) {
                        success, message in
                        if success {
                            self.registerSuccess = true
                            self.showingRegistrationView = false
                        } else {
                            self.firstNameHasError = true
                            self.lastNameHasError = true
                            self.emailHasError = true
                            self.passwordHasError = true
                        }
                    }
                    
                    print("User registered with First Name: \(firstName), Last Name: \(lastName), Email: \(email)")
                }
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
        .fullScreenCover(isPresented: $registerSuccess) {
            ConfirmEmailScreen()
        }
    }
    
    func validateFields() -> Bool {
        if firstName.isEmpty {
            firstNameHasError = true
            return false
        }
        
        if lastName.isEmpty {
            lastNameHasError = true
            return false
        }
        
        if !isValidEmail(email) {
            emailHasError = true
            return false
        }
        
        if password.count < 8 {
            passwordHasError = true
            return false
        }
        
        self.firstNameHasError = false
        self.lastNameHasError = false
        self.emailHasError = false
        self.passwordHasError = false
        return true
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(showingRegistrationView: .constant(true))
    }
}

