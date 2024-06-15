import SwiftUI

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var selectedEvent: Event? = nil
    
    func fetchEvents() {
        print("Rozpoczynam fetchowanie wydarzeń...")
        
        let url = URL(string: "http://\(Config.baseURL)/api/v1/event/all?key=\(Config.apiKey)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Błąd podczas fetchowania: \(error)")
                DispatchQueue.main.async {
                    self.events = []
                }
                return
            }
            
            guard let data = data else {
                print("Brak danych")
                DispatchQueue.main.async {
                    self.events = []
                }
                return
            }
            
            do {
                let decodedEvents = try JSONDecoder().decode([Event].self, from: data)
                print("Pobrano \(decodedEvents.count) wydarzeń")
                DispatchQueue.main.async {
                    self.events = decodedEvents
                }
            } catch {
                print("Błąd dekodowania danych: \(error)")
                DispatchQueue.main.async {
                    self.events = []
                }
            }
        }.resume()
    }
}
