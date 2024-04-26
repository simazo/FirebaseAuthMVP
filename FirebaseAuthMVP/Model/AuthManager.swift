//
//  AuthManager.swift
//  FirebaseAuthMVP
//
//  Created by pero on 2024/04/26.
//

import Firebase

class AuthManager {
    static let shared = AuthManager()
    
    func login(email: String, password: String, completion: @escaping (Bool, Error?) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
}
