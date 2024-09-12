//
//  MoreVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 09/09/2024.
//

import UIKit

class MoreVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBackground(innerView: nil)
    }

    @IBAction func profileTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @IBAction func notificationsTapped(_ sender: UIButton) {
        navigationController?.pushViewController(NotificationsViewController(), animated: true)
    }
}
