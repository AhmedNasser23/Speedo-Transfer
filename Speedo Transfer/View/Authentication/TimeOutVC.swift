//
//  TimeOutVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 07/09/2024.
//

import UIKit

class TimeOutVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var warningView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpScreen()
    }
    
    // MARK: - Actions
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        self.warningView.isHidden = true
    }
    
    // MARK: - Private Methods
    private func setUpScreen() {
        self.navigationController?.isNavigationBarHidden = true
        UIColor.setupBackgroundColor(for: self.view, bottomColor: UIColor(hex: "FFC1C7"))
        UIColor.setupBackgroundColor(for: self.innerView, bottomColor: UIColor(hex: "FFC1C7"))
        TextFieldHelper.addRightIcon(to: emailTextField, imageName: "envelope.fill")
        addPasswordToggle(to: passwordTextField)
        self.warningView.layer.cornerRadius = 10
    }
    
}
