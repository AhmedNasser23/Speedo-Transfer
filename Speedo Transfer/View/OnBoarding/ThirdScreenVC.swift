//
//  ThirdScreenVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 09/09/2024.
//

import UIKit

class ThirdScreenVC: UIViewController {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpScreen()
    }

    // MARK: - Actions
    @IBAction func nextBtnTapped(_ sender: Any) {
        self.goToSignUp()
    }
    
    // MARK: - Private Methods
    private func setUpScreen() {
        UIColor.setupBackgroundColor(for: self.view, bottomColor: UIColor(hex: "FFC1C7"))
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .done, target: self, action: #selector(goToSignUp))
    }
    
    @objc private func goToSignUp() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = SignUpBasicInfoVC()
    }
}
