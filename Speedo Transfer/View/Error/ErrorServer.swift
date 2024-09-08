//
//  ErrorInternetConnectionVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 08/09/2024.
//

import UIKit

class ErrorServer: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var errorImageView: UIImageView!
    @IBOutlet weak var messageUsButton: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - UI Setup
    func setupUI() {
        errorImageView.image = UIImage(named: "cuate.png")
        self.navigationController?.isNavigationBarHidden = true
        UIColor.setupBackgroundColor(for: self.view, topColor: UIColor(hex: "FFF8E7"), bottomColor: UIColor(hex: "FFEAEE"))
        UIColor.setupBackgroundColor(for: self.innerView, topColor: UIColor(hex: "FFF8E7"), bottomColor: UIColor(hex: "FFEAEE"))
        
        messageUsButton.layer.borderColor = UIColor(hex: "521220").cgColor
        messageUsButton.layer.borderWidth = 2.0
        messageUsButton.layer.cornerRadius = 8.0
    }

    // MARK: - Actions
    @IBAction func updateBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func messageUsBtnTapped(_ sender: UIButton) {
        
    }
}
