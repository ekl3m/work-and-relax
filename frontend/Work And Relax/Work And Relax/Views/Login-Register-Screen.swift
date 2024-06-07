import SwiftUI

struct Login_Register_Screen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginMessage: String = ""
    @State private var isAuthenticated: Bool = false
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 20) {
                    Spacer()
                    
                    VStack(spacing: -15) {
                        Image(systemName: "person.2.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color(red: 54/255, green: 85/255, blue: 143/255))
                        
                        Text("Zaloguj się lub zarejestruj się")
                            .font(.custom("LeagueGothic-Regular", size: 40))
                            .foregroundColor(Color(red: 54/255, green: 85/255, blue: 143/255))
                    }
                    .padding(.bottom, 30)
                    
                    VStack(spacing: 30) {
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(showError ? Color.red : Color(red: 54/255, green: 85/255, blue: 143/255))
                                .padding(.leading, 15)
                            TextField("email", text: $email)
                                .padding(.leading, 12)
                                .foregroundColor(showError ? Color.red : Color.black)
                                .onTapGesture {
                                    showError = false
                                }
                        }
                        .frame(height: 50)
                        .frame(width: UIScreen.main.bounds.width * 1 / 2 + 105)
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(radius: 5)
                        .padding(.horizontal, 30)

                        HStack {
                            Image(systemName: "lock.fill")
                                .foregroundColor(showError ? Color.red : Color(red: 54/255, green: 85/255, blue: 143/255))
                                .padding(.leading, 17)
                            SecureField("hasło", text: $password)
                                .padding()
                                .foregroundColor(showError ? Color.red : Color.black)
                                .onTapGesture {
                                    showError = false
                                }
                        }
                        .frame(height: 50)
                        .frame(width: UIScreen.main.bounds.width * 1 / 2 + 105)
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(radius: 5)
                        .padding(.horizontal, 30)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 130)
                    
                    VStack(spacing: 30) {
                        Button(action: {
                            login(email: self.email, password: self.password) { success, message in
                                if success {
                                    self.isAuthenticated = true
                                } else {
                                    self.showError = true
                                    //self.loginMessage = message ?? "Invalid username or password"
                                }
                            }
                        }) {
                            Text("Zaloguj się")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: UIScreen.main.bounds.width * 1 / 2 + 80)
                                .padding()
                                .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                                .cornerRadius(25)
                                .shadow(radius: 5)
                        }
                        
                        Button(action: {
                            // Handle guest login action
                        }) {
                            Text("Gość")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: UIScreen.main.bounds.width * 1 / 2 + 80)
                                .padding()
                                .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                                .cornerRadius(25)
                                .shadow(radius: 5)
                        }
                        
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.gray, Color.clear]), startPoint: .leading, endPoint: .trailing))
                            .frame(height: 1)
                            .frame(width: UIScreen.main.bounds.width * 1 / 2 + 80)
                            .padding(.horizontal, 30)
                        
                        Button(action: {
                            // Handle register action
                        }) {
                            Text("Zarejestruj się")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: UIScreen.main.bounds.width * 1 / 2 + 80)
                                .padding()
                                .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                                .cornerRadius(25)
                                .shadow(radius: 5)
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, -110)
                    
                    Spacer()
                }
                .background(
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 237 / 255, green: 237 / 255, blue: 237 / 255))
                            .frame(
                                width: UIScreen.main.bounds.width * 1 / 2 + 160,
                                height: UIScreen.main.bounds.height / 2 + 200
                            )
                    }
                )
                .cornerRadius(20)
                .padding(.horizontal, 16)
            }
            .alert(isPresented: Binding<Bool>(
                get: { !loginMessage.isEmpty },
                set: { _ in loginMessage = "" }
            )) {
                Alert(title: Text("Login"), message: Text(loginMessage), dismissButton: .default(Text("OK")))
            }
            .fullScreenCover(isPresented: $isAuthenticated) {
                // Navigate to your main screen on successful login
                NavBar() // Replace with your main screen
            }
        }
    }
}

struct Login_Register_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Login_Register_Screen()
    }
}
