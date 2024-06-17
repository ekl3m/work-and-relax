import SwiftUI

struct ProfileSettingsView: View {
    @EnvironmentObject var userManager: UserManager
    @Binding var isPresented: Bool
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var verificationCode: String = ""
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: Color(red: 0.21, green: 0.33, blue: 0.56), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.57, green: 0.65, blue: 1), location: 0.49),
                    Gradient.Stop(color: .white, location: 1.00),
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            isPresented = false
                        }) {
                            Image(systemName: "arrowshape.left.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .padding(.top, 8)
                        }
                        .padding(.leading, 20)
                        
                        Spacer(minLength: 155)
                        
                        Text("Edytuj Profil")
                            .font(.custom("WorkSans-ExtraBold", size: 34))
                            .foregroundColor(.white)
                            .padding(.top, 5)
                            .padding(.leading, -90)
                        
                        Spacer()
                    }
                    
                    Spacer(minLength: 835)
                }
            )
            
            Rectangle()
                .foregroundColor(.white)
                .padding(.top, 120)
            
            VStack(alignment: .leading, spacing: 20) {
                // Zmiana zdjęcia profilowego
                HStack {
                    Spacer()
                    
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                            .onTapGesture {
                                showingImagePicker = true
                            }
                            .padding(.bottom, 20)
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    } else {
                        Color.gray
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(
                                VStack {
                                    Image(systemName: "person.fill")
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.white)
                                        .font(.system(size: 90))
                                        .padding(.top, 18)
                                        .clipShape(Circle())
                                }
                            )
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .onTapGesture {
                                showingImagePicker = true
                            }
                    }
                    
                    Spacer()
                }
                
                // Zmiana imienia
                TextField("Imię", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                // Zmiana nazwiska
                TextField("Nazwisko", text: $surname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                // Zmiana emaila
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                // Weryfikacja emaila
                if let user = userManager.user {
                    if !user.verified {
                        HStack {
                            TextField("Kod weryfikacyjny", text: $verificationCode)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            
                            Spacer()
                            
                            Button(action: {
                                verifyEmail()
                            }) {
                                Text("Zweryfikuj")
                                    .padding()
                                    .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Zmiana hasła
                SecureField("Nowe hasło", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Potwierdź nowe hasło", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    saveChanges()
                }) {
                    Text("Zapisz zmiany")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 54/255, green: 85/255, blue: 143/255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding(.top, -170)
            .onAppear {
                loadUserProfile()
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
    
    func loadUserProfile() {
        if let user = userManager.user {
            self.name = user.name
            self.surname = user.surname
            self.email = user.email
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        profileImage = Image(uiImage: inputImage)
    }
    
    func verifyEmail() {
        if let user = userManager.user {
            if user.verificationCode == Int(verificationCode) {
                userManager.verifyUser { success, message in
                    print("Verification message: \(message ?? "")")
                }
            } else {
                print("Incorrect verification code.")
            }
        }
    }
    
    func saveChanges() {
        // Implement save logic here
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView(isPresented: .constant(true))
            .environmentObject(UserManager())
    }
}
