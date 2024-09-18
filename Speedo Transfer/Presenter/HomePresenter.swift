//
//  HomePresenter.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 18/09/2024.
//

import Foundation

class HomePresenter {
    static func retieveTransactions(accountNumber: String, pageNo: Int, pageSize: Int, sortBy: String, token: String) -> [Transaction]? {
        
        var transactions: [Transaction] = []
        
        APIManager.fetchTransactions(accountNumber: accountNumber, pageNo: pageNo, pageSize: pageSize, sortBy: sortBy, token: token) { result in
            switch result {
            case .success(let transactionResponse):
                print("Success! Transactions: \(transactionResponse.transactions)")
                transactions = transactionResponse.transactions
                    print("Success!")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        return transactions
    }
}
