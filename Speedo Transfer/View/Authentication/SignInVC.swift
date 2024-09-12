//
//  SignInVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 07/09/2024.
//

import UIKit

class SignInVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var presenter: LoginPresenterProtocol!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpScreen()
        UserDefaultsManager.shared().isLoggedin = false
        
        presenter = AuthenticationPresenter(view: self)
    }
    
    // MARK: - Actions
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        self.presenter.tryLogin(email: emailTextField.text ?? ""    , password: passwordTextField.text ?? "")
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = SignUpBasicInfoVC()
    }
    
    // MARK: - Private Methods
    private func setUpScreen() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.isNavigationBarHidden = true
        UIColor.setupBackgroundColor(for: self.view, bottomColor: UIColor(hex: "FFC1C7"))
        UIColor.setupBackgroundColor(for: self.innerView, bottomColor: UIColor(hex: "FFC1C7"))
        TextFieldHelper.addRightIcon(to: emailTextField, imageName: "envelope.fill")
        addPasswordToggle(to: passwordTextField)
    }
}

// MARK: - SignInVC Extension for Protocol
extension SignInVC: AuthenticationProtocol {
    func showMessage(title: String?, message: String?) {
        self.showAlert(title: title, message: message)
    }
    
    func goToNextStep() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = TabBarController()
    }
}
