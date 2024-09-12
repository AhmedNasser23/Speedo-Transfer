//
//  APIManager.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 06/09/2024.
//

import Foundation
import Alamofire

class APIManager {
    
    private static let registerURL = "https://money-transfer-service.onrender.com/api/v1/register"
    private static  let loginURL = "https://money-transfer-service.onrender.com/api/v1/auth/login"
    
    static func registerUser(user: UserRequest, completion: @escaping (Result<UserResponse, Error>) -> Void) {
        AF.request(registerURL, method: .post, parameters: user, encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: UserResponse.self) { response in
                switch response.result {
                case .success(let userResponse):
                    completion(.success(userResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let parameters = LoginRequest(email: email, password: password)
        
        AF.request(loginURL, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let loginResponse):
                    print("Success Login")
                    print(loginResponse.token)
                    UserDefaults.standard.set(loginResponse.token, forKey: "authToken")
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
