//
//  TransactionDetailsViewController.swift
//  zaher
//
//  Created by Mohamed on 11/09/2024.
//

import UIKit

class TransactionDetailsViewController: UIViewController {
    
    @IBOutlet weak var senderContainerView: UIView!
    @IBOutlet weak var infoContainerView: UIView!
    @IBOutlet weak var reciverContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    
    private func setupAppearance() {
        [senderContainerView, infoContainerView, reciverContainerView].forEach({
            $0?.layer.cornerRadius = 8
        })
    }
    
}
