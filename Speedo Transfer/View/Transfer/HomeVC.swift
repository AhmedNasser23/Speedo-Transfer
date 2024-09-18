//
//  HomeVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 09/09/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var balanceInfoImageView: UIImageView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var userInitialsLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var transactionsTableView: UITableView!
    
    // MARK: - Properties
    var userTransactions: [Transaction] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
        self.setUpTableView()
        self.setUpComponents()
        self.bindData()
    }
    
    // MARK: - Private Methods
    
    private func bindData() {
        
        let userAccount = UserDefaultsManager.shared().userData?.accounts.first
        
        userTransactions = HomePresenter.retieveTransactions(accountNumber: userAccount!.accountNumber, pageNo: 1, pageSize: 5, sortBy: "id", token: UserDefaultsManager.shared().token!) ?? []
    }
    
    private func setUpUI() {
        self.navigationController?.isNavigationBarHidden = true
        self.setUpBackground(innerView: nil)
        self.balanceInfoImageView.layer.cornerRadius = 10.0
        self.balanceInfoImageView.clipsToBounds = true
    }
    
    private func setUpComponents() {
        if let userAccountData = UserDefaultsManager.shared().userData?.accounts.first {
            let balance = userAccountData.balance
            let accountName = userAccountData.accountName
            self.balanceLabel.text = String(format: "%.2f", balance)
            
            self.userNameLabel.text = accountName
            let nameComponents = accountName.split(separator: " ")
            let initials = nameComponents.compactMap { $0.first }.map { String($0) }.joined()
            
            self.userInitialsLabel.text = initials.isEmpty ? "N/A" : initials
        } else {
            self.balanceLabel.text = "0.00"
            self.userNameLabel.text = "No Account Data"
        }
    }
    
    private func setUpTableView() {
        transactionsTableView.register(UINib(nibName: "transactionCell", bundle: nil), forCellReuseIdentifier: "TransactionCell")
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
    }
}

// MARK: - Extensions
extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTransactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! transactionCell

        let transaction = userTransactions[indexPath.row]
        cell.configureCell(transaction: transaction)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

}
