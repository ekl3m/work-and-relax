import Foundation

func register(name: String, surname: String, email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
    let baseURL = "http://20.107.170.217:8080/api/v1/userprofile/byEmail?key=yK9v2TA1GZkq3dTbdfR_1v1NCxE_H9oK4i5H0QKslHg&email="
    guard let url = URL(string: baseURL + email) else {
        print("Invalid URL")
        return
    }
}
