//
//  ErrorServerVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 08/09/2024.
//

import UIKit

class ErrorInternetConnection: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var vectorImageView: UIImageView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        vectorImageView.image = UIImage(named: "Vector.png")
        
        self.navigationController?.isNavigationBarHidden = true
        self.setUpBackground(innerView: innerView)
    }

    // MARK: - Actions
    @IBAction func updateBtnTapped(_ sender: UIButton) {
    }
}
