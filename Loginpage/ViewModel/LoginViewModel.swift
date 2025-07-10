//
//  LoginViewModel.swift
//  Loginpage
//
//  Created by Praveen on 19/05/25.
//

class LoginViewModel {
    
     var user: UserModel = UserModel(email: "", password: "", id: "", createdAt: "", name: "", avatar: "")
    
    //this code is used for avoiding the empty logins
    var isLoginEnabled: Bool {
        return !user.email.isEmpty && !user.password.isEmpty
    }
    
    func updateUsername(_ username: String) {
        user.email = username
    }
    
    func updatePassword(_ password: String) {
        user.password = password
    }
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        APIServices.shared.login(email: user.email, password: user.password) { success in
                completion(success)
                     
            }
        }
    
//    func login(completion: (Bool, String?) -> Void) {
//        if user.email == "admin" && user.password == "1234" {
//            completion(true, nil)
//        }
//        else {
//            completion(false, "Invalid username or password")
//        }
//    }
}
//https://686d3a81c9090c495385ae4f.mockapi.io/io/users/
