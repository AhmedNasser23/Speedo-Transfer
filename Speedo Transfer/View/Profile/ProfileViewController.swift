//
//  ProfileViewController.swift
//  Speedo Transfer
//
//  Created by Mohamed on 11/09/2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        nameContainerView.layer.cornerRadius = 24
    }
    
    @IBAction func favoutieTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func paymentHistoryTapped(_ sender: UIButton) {
        navigationController?.pushViewController(TransactionsViewController(), animated: true)
    }
    
    
    @IBAction func settingsTapped(_ sender: UIButton) {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    @IBAction func personalInformationTapped(_ sender: UIButton) {
        navigationController?.pushViewController(PersonalInfomrationViewController(), animated: true)
    }
}
