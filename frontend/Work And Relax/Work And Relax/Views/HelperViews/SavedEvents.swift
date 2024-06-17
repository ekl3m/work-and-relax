import SwiftUI

struct SavedEvents: View {
    @EnvironmentObject var userManager: UserManager
    @Binding var isPresented: Bool
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            // Górny gradientowy nagłówek
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.21, green: 0.33, blue: 0.56), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.57, green: 0.65, blue: 1), location: 0.49),
                    Gradient.Stop(color: .white, location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
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
                        .padding(.leading, 60)
                        
                        Spacer()
                        
                        Text("Zapisane")
                            .font(.custom("WorkSans-ExtraBold", size: 34))
                            .foregroundColor(.white)
                            .padding(.top, 5)
                            .padding(.leading, -90)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            )
            
            Rectangle()
                .frame(width: 500)
                .offset(y: 200)
                .foregroundColor(.white)
            
            Rectangle()
                .foregroundColor(.white)
                .padding(.top, 70)
            
            SearchBar2(searchText: $searchText)
                .padding(.horizontal)
                .padding(.bottom, 620)
            
            ScrollView {
//                EventRow(event: Event(
//                    id: Int64(1),
//                    title: "Przykładowe",
//                    eventDate: "2024-07-15T15:00:00",
//                    description: "Opis przykładowego wydarzenia, które jest bardzo interesujące.",
//                    photo: "https://i.imgur.com/fk3bVFl.jpg"
//                ))
                ForEach(filteredEvents) { event in
                    EventRow(event: event)
                }
                .padding(.top, 20)
            }
            .refreshable {
                userManager.fetchSavedEvents()
            }
            .frame(width: UIScreen.main.bounds.width, height: 800)
            .padding(.bottom, -290)
        }
        .onAppear {
            userManager.fetchSavedEvents()
        }
    }
    
    private var filteredEvents: [Event] {
        if searchText.isEmpty {
            return userManager.savedEventObjects
        } else {
            return userManager.savedEventObjects.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct EventRow: View {
    let event: Event
    
    var body: some View {
        HStack {
            if let url = URL(string: event.photo) {
                AsyncImage(url: url) { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.leading, 15)
            }
            
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding(.bottom, 1)
                
                Text(convertDateFormat(inputDate: event.eventDate))
                    .font(.system(size: 18))
            }
            .padding(.leading, 30)
            
            Spacer()
        }
        .background(
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 120)
                .foregroundColor(Color(.systemGray6))
        )
        .padding(.bottom, 40)
    }
}

#Preview {
    SavedEvents(isPresented: .constant(true))
        .environmentObject(UserManager())
}
