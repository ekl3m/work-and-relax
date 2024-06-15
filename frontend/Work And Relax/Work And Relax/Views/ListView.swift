import SwiftUI
import SwiftUIIntrospect

struct LocationListView: View {
    @StateObject private var viewModel = LocationViewModel()
    @Binding var showList: Bool
    @Binding var searchText: String
    @Binding var showRestaurants: Bool
    
    @State private var keyboardHeight: CGFloat = 0
    
    var filteredLocations: [Location] {
        let filtered = viewModel.locations.filter { location in
            (showRestaurants == location.restaurant) &&
            (searchText.isEmpty || location.name.localizedCaseInsensitiveContains(searchText))
        }
        print("Filtered locations: \(filtered)")
        return filtered
    }
    
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
                HStack {
                    Button(action: {
                        self.showList = false
                    }) {
                        Image(systemName: "arrow.left")
                            .frame(width: 5, height: 5)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding(.leading, 10)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }
                    .padding(.leading,0)
                    Spacer()
                    Button(action: {
                        showRestaurants = true
                    }) {
                        Text("Restauracje")
                            .foregroundColor(showRestaurants ? .black : .white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(showRestaurants ? Color.white : Color(.systemGray).opacity(0.3))
                            .cornerRadius(20)
                    }
                    .frame(height: 40)
                    
                    Button(action: {
                        showRestaurants = false
                    }) {
                        Text("Rozrywka")
                            .foregroundColor(!showRestaurants ? .black : .white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(!showRestaurants ? Color.white : Color(.systemGray).opacity(0.3))
                            .cornerRadius(20)
                        
                    }
                    .frame(height: 40)
                    Spacer(minLength: 70)
                }
                .padding()
                
                SearchBar(searchText: $searchText)
                    .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        ForEach(filteredLocations) { location in
                            LocationView(location: location, onSelect: { _, _ in })
                                .padding(.horizontal)
                                
                        }
                    }
                }
                .onAppear {
                    print("Fetching locations...")
                    viewModel.fetchLocations()
                    addKeyboardObservers()
                }
                .refreshable {
                    print("Fetching locations...")
                    viewModel.fetchLocations()
                }
                .introspect(.scrollView, on: .iOS(.v17, .v16, .v15)) { scrollView in
                    scrollView.refreshControl?.tintColor = .white
                }
                .padding(.top)
            }
            .padding(.top, 40)
            .padding(.bottom, keyboardHeight)
            .onDisappear {
                removeKeyboardObservers()
            }
        }
    }
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                keyboardHeight = keyboardFrame.height
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
            keyboardHeight = 0
        }
    }
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.white))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .frame(maxWidth: 380)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 16)
                    }
                )
        }
        .padding(.top, 10)
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView(showList: .constant(true), searchText: .constant(""), showRestaurants: .constant(true))
    }
}
