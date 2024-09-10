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
    @IBOutlet weak var transactionDateLabel: UILabel!
    @IBOutlet weak var transactionAmountLabel: UILabel!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell() {
        self.recipientNameLabel.text = "Ahmed Nasser"
        self.transactionDateLabel.text = "Today 11:00 - Received"
        self.transactionAmountLabel.text = "500"
    }
}
