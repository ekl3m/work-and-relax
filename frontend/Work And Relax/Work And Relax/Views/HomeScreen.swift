import SwiftUI
import SwiftUIIntrospect

struct HomeScreen: View {
    @EnvironmentObject var userManager: UserManager
    @StateObject private var viewModel = EventViewModel()
    @StateObject private var viewModel2 = AnnouncementViewModel()
    @State private var dominantColor: Color = .gray
    @State private var textColor: Color = .white
    @State private var showingEvents = true
    
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
                        HStack {
                            Button(action: {
                                showingEvents = true
                            }) {
                                Text("Wydarzenia")
                                    .foregroundColor(showingEvents ? .black : .white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(showingEvents ? Color.white : Color(.systemGray).opacity(0.3))
                                    .cornerRadius(20)
                            }
                            .frame(height: 40)
                            
                            Button(action: {
                                showingEvents = false
                            }) {
                                Text("Ogłoszenia")
                                    .foregroundColor(!showingEvents ? .black : .white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(!showingEvents ? Color.white : Color(.systemGray).opacity(0.3))
                                    .cornerRadius(20)
                            }
                            .frame(height: 40)
                        }
                        .padding()

                        if showingEvents {
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
                                }
                            }
                            .padding(.horizontal, 30)
                        } else {
                            ForEach(viewModel2.announcements, id: \.id) { announcement in
                                Button(action: {
                                    print("Selected event \(announcement.id)")
                                    viewModel2.selectedAnnouncement = announcement
                                }) {
                                    AnnouncementView(announcement: announcement, onSelect: { dominantColor, textColor in
                                        print("Selected announcement \(announcement.id)")
                                        viewModel2.selectedAnnouncement = announcement
                                        self.dominantColor = dominantColor
                                        self.textColor = textColor
                                    })
                                    .buttonStyle(PlainButtonStyle())
                                    .background(Color.clear)  // Ensure each EventView has its own background to handle taps
                                    .contentShape(Rectangle())  // Ensure the entire button area is tappable
                                }
                            }
                            .padding(.horizontal)
                            
                        }
                        
                        Spacer().frame(height: 20)
                    }
                }
                .onAppear {
                    viewModel.fetchEvents()
                    viewModel2.fetchAnnouncements()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .refreshable {
                    viewModel.fetchEvents()
                    viewModel2.fetchAnnouncements()
                }
                .introspect(.scrollView, on: .iOS(.v17, .v16, .v15)) { scrollView in
                    scrollView.refreshControl?.tintColor = .white
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            if let selectedEvent = viewModel.selectedEvent {
                EventDetailView(event: selectedEvent, dominantColor: dominantColor, textColor: textColor, goBack: {
                    withAnimation {
                        viewModel.selectedEvent = nil
                    }
                })
                .padding(.horizontal, 30)
                .transition(.opacity)
                .zIndex(1)  // Ensure it appears above the HomeScreen content
            }
            if let selectedAnnouncement = viewModel2.selectedAnnouncement {
                AnnouncementDetailView(announcement: selectedAnnouncement, dominantColor: dominantColor, textColor: textColor, goBack: {
                    withAnimation {
                        viewModel2.selectedAnnouncement = nil
                    }
                })
                .padding(.horizontal, 30)
                .transition(.opacity)
                .zIndex(1)  // Ensure it appears above the HomeScreen content
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(UserManager())
}
