import SwiftUI

struct RegistrationView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Text("Register")
                .font(.largeTitle)
                .padding(.bottom, 40)
            
            TextField("First Name", text: $firstName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            TextField("Last Name", text: $lastName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5.0)
                .padding(.bottom, 40)
            
            Button(action: {
                // Akcja rejestracji
                print("User registered with First Name: \(firstName), Last Name: \(lastName), Email: \(email)")
            }) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
        .padding()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
