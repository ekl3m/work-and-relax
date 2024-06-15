import SwiftUI

class AnnouncementViewModel: ObservableObject {
    @Published var announcements: [Announcement] = []
    @Published var selectedAnnouncement: Announcement? = nil
    
    func fetchAnnouncements() {
        print("Rozpoczynam fetchowanie ogłoszeń...")
        
        let url = URL(string: "http://\(Config.baseURL)/api/v1/announcement/all?key=\(Config.apiKey)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Błąd podczas fetchowania: \(error)")
                DispatchQueue.main.async {
                    self.announcements = []
                }
                return
            }
            
            guard let data = data else {
                print("Brak danych")
                DispatchQueue.main.async {
                    self.announcements = []
                }
                return
            }
            
            do {
                let decodedAnnouncements = try JSONDecoder().decode([Announcement].self, from: data)
                print("Pobrano \(decodedAnnouncements.count) wydarzeń")
                DispatchQueue.main.async {
                    self.announcements = decodedAnnouncements
                }
            } catch {
                print("Błąd dekodowania danych: \(error)")
                DispatchQueue.main.async {
                    self.announcements = []
                }
            }
        }.resume()
    }
}
