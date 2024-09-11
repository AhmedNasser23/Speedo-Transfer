//
//  FavoriteRecipientCell.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 11/09/2024.
//

import UIKit

class FavoriteRecipientCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var recipientNameLabel: UILabel!
    @IBOutlet weak var recipientAccoutNumberLabel: UILabel!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with recipient: (String, String)) {
        recipientNameLabel.text = "\(recipient.0)"
        recipientAccoutNumberLabel.text = "\(recipient.1)"
    }
}
