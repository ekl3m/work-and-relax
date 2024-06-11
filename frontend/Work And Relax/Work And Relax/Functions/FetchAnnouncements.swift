import SwiftUI

class AnnouncementViewModel: ObservableObject {
    @Published var announcements: [Announcement] = []
    @Published var selectedAnnouncement: Announcement? = nil
    
    func fetchAnnouncements() {
        print("Rozpoczynam fetchowanie ogłoszeń...")
        
        let url = URL(string: "http://20.107.170.217:8080/api/v1/announcement/all?key=yK9v2TA1GZkq3dTbdfR_1v1NCxE_H9oK4i5H0QKslHg")!
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
