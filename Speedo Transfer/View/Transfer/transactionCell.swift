//
//  transactionCell.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 09/09/2024.
//

import UIKit

class transactionCell: UITableViewCell {

    @IBOutlet weak var recipientNameLabel: UILabel!
    @IBOutlet weak var transactionDateLabel: UILabel!
    @IBOutlet weak var transactionAmountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        self.recipientNameLabel.text = "Ahmed Nasser"
        self.transactionDateLabel.text = "Today 11:00 - Received"
        self.transactionAmountLabel.text = "500"
    }
}
