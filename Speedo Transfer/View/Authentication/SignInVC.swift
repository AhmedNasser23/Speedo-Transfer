//
//  SignInVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 07/09/2024.
//

import UIKit

class SignInVC: UIViewController {


    @IBOutlet var outerView: UIView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpScreen()
        
    }
    
    @IBAction func signInBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = SignUpBasicInfoVC()
    }
    
    private func setUpScreen() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.isNavigationBarHidden = true
        UIColor.setupBackgroundColor(for: self.outerView)
        UIColor.setupBackgroundColor(for: self.innerView)
        TextFieldHelper.addRightIcon(to: emailTextField, imageName: "envelope.fill")
        addPasswordToggle(to: passwordTextField)
    }
}
