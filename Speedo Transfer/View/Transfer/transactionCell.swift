//
//  transactionCell.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 09/09/2024.
//

import UIKit

class transactionCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var recipientNameLabel: UILabel!
    @IBOutlet weak var recipientAccountNumber: UILabel!
    @IBOutlet weak var transactionAmountLabel: UILabel!
    @IBOutlet weak var transcationDateLabel: UILabel!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(transaction: Transaction) {
        self.recipientNameLabel.text = transaction.senderName
        self.recipientAccountNumber.text = transaction.senderAccountNumber
        self.transactionAmountLabel.text = "\(transaction.amountTransferred)\(transaction.currency)"
        self.transcationDateLabel.text = transaction.createdAt
    }
}
