//
//  APIManager.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 06/09/2024.
//

import Foundation
import Alamofire

class APIManager {
    
    private static let registerURL = "https://money-transfer-service.onrender.com/api/v1/auth/register"
    private static  let loginURL = "https://money-transfer-service.onrender.com/api/v1/auth/login"
    private static  let transactionsURL = "https://money-transfer-service.onrender.com/api/v1/account"
    
    static func registerUser(user: UserRequest, completion: @escaping (Result<UserResponse, Error>) -> Void) {
        AF.request(registerURL, method: .post, parameters: user, encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: UserResponse.self) { response in
                switch response.result {
                case .success(let userResponse):
                    print("Success Register")
                    completion(.success(userResponse))
                case .failure(let error):
                    print("Erorr \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }
    
    static func login(loginRequestModel: LoginRequestModel, completion: @escaping (Result<Void, Error>) -> Void) {
        
        AF.request(loginURL, method: .post, parameters: loginRequestModel, encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: LoginResponseModel.self) { response in
                switch response.result {
                case .success(let loginResponse):
                    print("Success Login")
                    UserDefaultsManager.shared().token = loginResponse.token
                    completion(.success(()))
                case .failure(let error):
                    print("Erorr \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
       }
    
    static func fetchTransactions(accountNumber: String, pageNo: Int, pageSize: Int, sortBy: String, token: String, completion: @escaping (Result<TransactionResponse, Error>) -> Void) {
        let url = "\(transactionsURL)/\(accountNumber)/transactions"
        let parameters: [String: Any] = [
            "pageNo": pageNo,
            "pageSize": pageSize,
            "sortBy": sortBy
        ]
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers).validate().responseDecodable(of: TransactionResponse.self) { response in
            switch response.result {
            case .success(let transactionResponse):
                completion(.success(transactionResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
