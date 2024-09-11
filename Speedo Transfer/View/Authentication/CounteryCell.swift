//
//  CountertCell.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 11/09/2024.
//

import UIKit

class CounteryCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var flagNameLabel: UILabel!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with flag: String) {
        flagImageView.image = UIImage(named: flag)
        flagNameLabel.text = flag
    }
}
