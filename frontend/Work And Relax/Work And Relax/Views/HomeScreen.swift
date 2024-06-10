import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = EventViewModel()
    @State private var dominantColor: Color = .gray
    @State private var textColor: Color = .white
    
    var body: some View {
        ZStack {
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
            
            VStack(spacing: 0) {
                NavTitleBar()
                
                ScrollView {
                    VStack {
                        Spacer().frame(height: 20)

                        ForEach(viewModel.events, id: \.id) { event in
                            Button(action: {
                                print("Selected event \(event.id)")
                                viewModel.selectedEvent = event
                            }) {
                                EventView(event: event, onSelect: { dominantColor, textColor in
                                    print("Selected event \(event.id)")
                                    viewModel.selectedEvent = event
                                    self.dominantColor = dominantColor
                                    self.textColor = textColor
                                })
                                .buttonStyle(PlainButtonStyle())
                                .background(Color.clear)  // Ensure each EventView has its own background to handle taps
                                .contentShape(Rectangle())  // Ensure the entire button area is tappable
                                .onAppear {
                                    print("Event \(event.id) appeared in ScrollView")
                                }
                                .onDisappear {
                                    print("Event \(event.id) disappeared from ScrollView")
                                }
                            }
                        }
                        
                        Spacer().frame(height: 20)
                    }
                }
                .onAppear {
                    viewModel.fetchEvents()
                    print("Fetching events in HomeScreen")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .edgesIgnoringSafeArea(.top)
            
            if let selectedEvent = viewModel.selectedEvent {
                EventDetailView(event: selectedEvent, dominantColor: dominantColor, textColor: textColor, goBack: {
                    withAnimation {
                        viewModel.selectedEvent = nil
                    }
                })
                .transition(.move(edge: .trailing))
                .zIndex(1)  // Ensure it appears above the HomeScreen content
            }
        }
    }
}

#Preview {
    HomeScreen()
}
