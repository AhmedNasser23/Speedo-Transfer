//
//  TransactionsViewController.swift
//  zaher
//
//  Created by Mohamed on 11/09/2024.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Transactions"
        registerCells()
        assignDelegates()
    }

    private func registerCells() {
        tableView.register(UINib(nibName: TransactionTableViewCell.className, bundle: nil), forCellReuseIdentifier: TransactionTableViewCell.className)
    }
    
    private func assignDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.className, for: indexPath) as! TransactionTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(TransactionDetailsViewController(), animated: true)
    }
}
