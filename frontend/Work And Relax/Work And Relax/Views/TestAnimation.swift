import SwiftUI

struct TestAnimation: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            Text("fjdh")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue) // Dodaj tło, aby widok nie był przeźroczysty
        .edgesIgnoringSafeArea(.all) // Ignoruj bezpieczne obszary, aby zajmować całe dostępne miejsce
    }
}

#Preview {
    TestAnimation()
}
