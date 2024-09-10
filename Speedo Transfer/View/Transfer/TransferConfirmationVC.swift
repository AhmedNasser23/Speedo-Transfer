//
//  TransferConfirmationVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 10/09/2024.
//

import UIKit

class TransferConfirmationVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var senderView: UIView!
    @IBOutlet weak var recipientView: UIView!
    
    @IBOutlet weak var transferAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var senderAccountNumberLabel: UILabel!
    
    @IBOutlet weak var recipientNameLabel: UILabel!
    @IBOutlet weak var recipientAccountNumberLabel: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - Actions
    @IBAction func confirmBtnTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(TransferCompletionVC(), animated: true)
    }
    

    @IBAction func previousBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.previousBtnTapped(sender)
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        self.setUpBackground(innerView: innerView)
        self.navigationController?.isNavigationBarHidden = true
        
        self.previousButton.layer.borderColor = UIColor(hex: "521220").cgColor
        self.previousButton.layer.borderWidth = 2.0
        self.previousButton.layer.cornerRadius = 8.0
        
        self.senderView.layer.cornerRadius = 10.0
        self.recipientView.layer.cornerRadius = 10.0
    }
    
}
