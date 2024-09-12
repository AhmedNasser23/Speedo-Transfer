//
//  User.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 11/09/2024.
//

import Foundation

struct UserBasicData {
    let name:  String
    let email: String
    let password: String
}


struct UserRequest: Codable {
    let name: String
    let email: String
    let password: String
    let country: String
    let dateOfBirth: String
    let phoneNumber: String = "0111111111"
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case password = "password"
        case country = "country"
        case dateOfBirth = "dateOfBirth"
        case phoneNumber = "phoneNumber"
    }
}

struct UserResponse: Codable {
    let id: Int
    let accounts: [Account]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case accounts = "accounts"
    }
}

struct Account: Codable {
    let accountNumber: String
    let balance: Double
    let currency: String
    let accountName: String
    
    enum CodingKeys: String, CodingKey {
        case accountNumber = "accountNumber"
        case balance = "balance"
        case currency = "currency"
        case accountName = "accountName"
    }
}


struct LoginRequest: Encodable {
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case password = "password"
    }
}

// Response Model
struct LoginResponse: Decodable {
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }
}
