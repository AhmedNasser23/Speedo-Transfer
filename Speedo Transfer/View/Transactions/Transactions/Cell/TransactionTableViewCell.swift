//
//  TransactionTableViewCell.swift
//  zaher
//
//  Created by Mohamed on 11/09/2024.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statusContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        containerView.layer.cornerRadius = 8
        containerView.dropShadow(opacity: 0.1, color: UIColor(hex: "#6C7686").cgColor)
        statusContainerView.layer.cornerRadius = 8
    }
}
