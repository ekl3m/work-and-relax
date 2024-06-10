import SwiftUI

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var selectedEvent: Event? = nil
    
    func fetchEvents() {
        print("Rozpoczynam fetchowanie wydarzeń...")
        
        let url = URL(string: "http://20.107.170.217:8080/api/v1/event/all?key=yK9v2TA1GZkq3dTbdfR_1v1NCxE_H9oK4i5H0QKslHg")!
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
