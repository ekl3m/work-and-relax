import Foundation

func register(user: NewUserProfile, completion: @escaping (Bool, String?) -> Void) {
    let baseURL = "http://20.107.170.217:8080/api/v1/userprofile/new?key=yK9v2TA1GZkq3dTbdfR_1v1NCxE_H9oK4i5H0QKslHg"
    guard let url = URL(string: baseURL) else {
        print("Invalid URL")
        completion(false, "Invalid URL")
        return
    }
    
    guard let httpBody = try? JSONEncoder().encode(user) else {
        print("Invalid JSON format")
        completion(false, "Invalid JSON format")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = httpBody
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            completion(false, error.localizedDescription)
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid response")
            completion(false, "Invalid response")
            return
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            print("Server error: \(httpResponse.statusCode)")
            completion(false, "Server error: \(httpResponse.statusCode)")
            return
        }
        
        guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
            print("No data or data decoding error")
            completion(false, "No data or data decoding error")
            return
        }
        
        print("Response: \(responseString)")
        completion(true, responseString)
    }
    
    task.resume()
}
