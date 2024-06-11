import Foundation

enum Items: Identifiable {
    case event(Event)
    case announcement(Announcement)
    
    var id: Int64 {
        switch self {
        case .event(let event):
            return event.id
        case .announcement(let announcement):
            return announcement.id
        }
    }
}
