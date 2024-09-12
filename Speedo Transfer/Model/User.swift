//
//  User.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 11/09/2024.
//

import Foundation
import Alamofire

struct UserSendedData: Codable {
    var name: String
    var email: String
    var password: String
    var dateOfBirth: String
    var country: String
    var phoneNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case name =  "name"
        case email =  "email"
        case password = "password"
        case dateOfBirth =  "dateOfBirth"
        case country =  "country"
        case phoneNumber =  "phoneNumber"
    }
}

struct UserRecivedData: Codable {
    var name: String?
    var email: String?
    var dateOfBirth: String?
    var country: String?
    var phoneNumber: String?
    var accounts: [Account]?
    
    enum CodingKeys: String, CodingKey {
        case name =  "name"
        case email =  "email"
        case dateOfBirth =  "dateOfBirth"
        case country =  "country"
        case phoneNumber =  "phoneNumber"
        case accounts = "accounts"
    }
}

struct Account: Codable {
    var accountNumber: String?
    var accountType: String?
    var balance: String?
    var currency: String?
    
    enum CodingKeys: String, CodingKey {
        case accountNumber =  "accountNumber"
        case accountType =  "accountType"
        case balance =  "balance"
        case currency =  "currency"
    }
}

/*
 
 {
   "id": 0,
   "name": "string",
   "email": "string",
   "dateOfBirth": "2024-09-11",
   "country": "string",
   "createdAt": "2024-09-11T21:24:05.363Z",
   "updatedAt": "2024-09-11T21:24:05.363Z",
   "phoneNumber": "string",
   "accounts": [
     {
       "id": 0,
       "accountNumber": "string",
       "accountType": "SAVINGS",
       "balance": 0,
       "currency": "EGP",
       "accountName": "string",
       "accountDescription": "string",
       "active": true,
       "createdAt": "2024-09-11T21:24:05.363Z",
       "updatedAt": "2024-09-11T21:24:05.363Z"
     }
   ]
 }
 
 */

