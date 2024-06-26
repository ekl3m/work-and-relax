import SwiftUI

struct NavTitleBar: View {
    var body: some View {
            HStack {
                Text("Work & Relax")
                    .font(.custom("WorkSans-ExtraBold", size: 34))
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding()
            .padding(.top, 30)
            .background(Color.clear)
        }
}

#Preview {
    NavTitleBar()
        .background {
            Color.blue  // NIEBIESKI KOLOR JEST TYLKO NA POTRZEBY PODGLADU, TLO JEST PRZEZROCZYSTE
        }
}
