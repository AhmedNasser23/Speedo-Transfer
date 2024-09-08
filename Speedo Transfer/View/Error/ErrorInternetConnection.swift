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
        UIColor.setupBackgroundColor(for: self.view, topColor: UIColor(hex: "FFF8E7"), bottomColor: UIColor(hex: "FFEAEE"))
        UIColor.setupBackgroundColor(for: self.innerView, topColor:UIColor(hex: "FFF8E7"), bottomColor: UIColor(hex: "FFEAEE"))
        
    }

    // MARK: - Actions
    @IBAction func updateBtnTapped(_ sender: UIButton) {
    }
}
