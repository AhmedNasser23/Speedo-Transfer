//
//  Transaction.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 18/09/2024.
//

import Foundation

struct Transaction: Codable {
    let senderName: String
    let senderAccountNumber: String
    let currency: String
    let amountTransferred: Double
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case senderName = "senderName"
        case senderAccountNumber = "senderAccountNumber"
        case currency = "currency"
        case amountTransferred = "amountTransferred"
        case createdAt = "createdAt"
    }
}


struct TransactionResponse: Codable {
    let transactions: [Transaction]
    
    enum CodingKeys: String, CodingKey {
        case transactions = "transactions"
    }
}
