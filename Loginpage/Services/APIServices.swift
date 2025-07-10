//
//  APIServices.swift
//  Loginpage
//
//  Created by Praveen on 08/07/25.
//

import Foundation
//struct LoginRequest: Codable {
//    let email: String
//    let password: String
//}
//
//struct LoginResponse: Codable {
//    let token: String
//}


class APIServices {
    
    static let shared = APIServices()
    
    private init() {
        
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string:"https://686d3a81c9090c495385ae4f.mockapi.io/io/users/Users") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let loginData = UserModel(email: email, password: password, id: "", createdAt: "", name: "", avatar: "")
        request.httpBody = try? JSONEncoder().encode(loginData)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error  {
                completion(false)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(true)
            } catch {
                completion(false)
            }
        }.resume()
    }
}
