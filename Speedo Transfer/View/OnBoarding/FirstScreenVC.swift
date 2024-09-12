//
//  FirstScreenVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 09/09/2024.
//

import UIKit

class FirstScreenVC: UIViewController {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpScreen()
        UserDefaultsManager.shared().isOpendBefore = true
    }
    
    // MARK: - Actions
    @IBAction func nextBtnTapped(_ sender: Any) {
        self.navigationController?.pushViewController(SecondScreenVC(), animated: true)
    }
    
    // MARK: - Private Methods
    private func setUpScreen() {
        UIColor.setupBackgroundColor(for: self.view, bottomColor: UIColor(hex: "FFC1C7"))
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .done, target: self, action: #selector(goToSignUp))
    }
    
    @objc private func goToSignUp() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = SignUpBasicInfoVC()
    }
}
