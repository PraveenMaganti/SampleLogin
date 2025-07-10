//
//  Model.swift
//  Loginpage
//
//  Created by Praveen on 19/05/25.
//
struct UserModel: Codable {
    var email: String
    var password: String
    let id: String
        let createdAt: String
        let name: String
        let avatar: String

        enum CodingKeys: String, CodingKey {
            case email
            case password
            case id
            case createdAt
            case name = "Praveen" // Map "Praveen" JSON key to `name` in Swift
            case avatar
        }
}

struct LoginResponse: Codable {
    let token: String
}
