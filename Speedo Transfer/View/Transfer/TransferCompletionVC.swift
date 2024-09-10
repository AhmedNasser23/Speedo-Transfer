//
//  TransferCompletionVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 10/09/2024.
//

import UIKit

class TransferCompletionVC: UIViewController {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var senderView: UIView!
    @IBOutlet weak var recipientView: UIView!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var senderAccountNumberLabel: UILabel!
    
    @IBOutlet weak var recipientNameLabel: UILabel!
    @IBOutlet weak var recipientAccountNumberLabel: UILabel!
    
    @IBOutlet weak var addToFavoritesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    
    // MARK: - Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(TransferCompletionVC(), animated: true)
    }
    

    @IBAction func backToHomeBtnTapped(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = UINavigationController(rootViewController: TabBarController())
    }
    
    
    @IBAction func addToFavoritesBtnTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        self.setUpBackground(innerView: innerView)
        self.navigationController?.isNavigationBarHidden = true
        
        self.addToFavoritesButton.layer.borderColor = UIColor(hex: "521220").cgColor
        self.addToFavoritesButton.layer.borderWidth = 2.0
        self.addToFavoritesButton.layer.cornerRadius = 8.0
        
        self.senderView.layer.cornerRadius = 10.0
        self.recipientView.layer.cornerRadius = 10.0
    }
    
}
