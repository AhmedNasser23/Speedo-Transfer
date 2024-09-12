//
//  APIManager.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 06/09/2024.
//

import Foundation
import Alamofire

class APIManager {
    static let baseURL = "https://money-transfer-service.onrender.com/api/v1/auth/register"
    
    static func register(user: UserSendedData, completion: @escaping (Result<UserRecivedData, Error>) -> Void) {
        
        let parameters: [String: String] = [
            "name": user.name,
            "email": user.email,
            "password": user.password,
            "dateOfBirth": user.dateOfBirth,
            "country": user.country,
            "phoneNumber": user.phoneNumber ?? "122"
        ]
        
        var RES: [Account] = []
        
        AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .response { response in
                guard let data = response.data else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(UserRecivedData.self, from: data)
                    RES = response.accounts ?? [Account(accountNumber: "404", accountType: "N/A", balance: "404", currency: "EGP")]
                    print("Success")
                    print(response)
                } catch let error {
                    print("NENENENNENE")
                    print(error.localizedDescription)
                }
            }
        print(RES)
    }
}
