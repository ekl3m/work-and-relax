import SwiftUI

struct TestAnimation: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            Text("IN PROGRESS...")
                .font(.title.bold())
                .zIndex(1)
            SpottedBlurredGradientView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue) // Dodaj tło, aby widok nie był przeźroczysty
        .edgesIgnoringSafeArea(.all) // Ignoruj bezpieczne obszary, aby zajmować całe dostępne miejsce
    }
}

struct SpottedBlurredGradientView: View {
    var body: some View {
        ZStack {
            // Gradient tła
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            // Nałożenie rozmytych jasnych plam
            BlurredPlamMaskView()
        }
    }
}

struct BlurredPlamMaskView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Tworzenie rozmytych plam
                ForEach(0..<20) { _ in
                    Circle()
                        .fill(Color.white.opacity(0.1))
                        .frame(width: CGFloat.random(in: 50...150), height: CGFloat.random(in: 50...150))
                        .position(x: CGFloat.random(in: 0...geometry.size.width),
                                  y: CGFloat.random(in: 0...geometry.size.height))
                        .blur(radius: 15) // Rozmycie plam
                }
            }
        }
        .blendMode(.overlay) // Użycie trybu mieszania
    }
}

#Preview {
    TestAnimation()
}
