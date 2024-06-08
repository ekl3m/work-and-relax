import Foundation

func convertDateFormat(inputDate: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    inputFormatter.locale = Locale(identifier: "en_US_POSIX")
    
    if let date = inputFormatter.date(from: inputDate) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd-MM-yyyy, 'godz.' HH:mm"
        outputFormatter.locale = Locale(identifier: "pl_PL")
        return outputFormatter.string(from: date)
    }
    
    return inputDate // Zwraca oryginalny ciąg w przypadku błędu parsowania
}
