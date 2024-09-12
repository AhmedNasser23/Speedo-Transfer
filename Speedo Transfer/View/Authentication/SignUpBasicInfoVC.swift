//
//  SignUpBasicInfoVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 06/09/2024.
//

import UIKit

class SignUpBasicInfoVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var InnerView: UIView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmedPasswordTextField: UITextField!
    
    // MARK: - Properties
    private var presenter: SignUpPresenterProtocol!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = AuthenticationPresenter(view: self)
        UserDefaultsManager.shared().isOpendBefore = true
        
        self.setUpScreen()
    }
    
    // MARK: - Actions
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        self.presenter.tryRegister!(name: fullNameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", confirmedPassword: confirmedPasswordTextField.text ?? "")
        
//        let user = UserRequest(
//            name: "Nasser Hemdan",
//            email: "nasserhemdan771@gmail.com",
//            password: "N@$$erHemdan",
//            country: "Egypt",
//            dateOfBirth: "2004-09-08"
//        )
//
//        APIManager.shared.registerUser(user: user) { result in
//            switch result {
//            case .success(let userResponse):
//                print("User ID: \(userResponse.id)")
//                for account in userResponse.accounts {
//                    print("Account Number: \(account.accountNumber)")
//                    print("Balance: \(account.balance)")
//                    print("Currency: \(account.currency)")
//                    print("Account Name: \(account.accountName)")
//                    print("----------------------")
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//                self.showAlert(title: "Sorry", message: "This email Already Exist")
//            }
//        }
    }
    
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = SignInVC()
    }
    
    // MARK: - Private Methods
    private func setUpScreen() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.isNavigationBarHidden = true
        UIColor.setupBackgroundColor(for: self.view, bottomColor: UIColor(hex: "FFC1C7"))
        UIColor.setupBackgroundColor(for: self.InnerView, bottomColor: UIColor(hex: "FFC1C7"))

        TextFieldHelper.addRightIcon(to: fullNameTextField, imageName: "person.fill")
        TextFieldHelper.addRightIcon(to: emailTextField, imageName: "envelope.fill")

        addPasswordToggle(to: passwordTextField)
        addPasswordToggle(to: confirmedPasswordTextField)
    }
}

extension SignUpBasicInfoVC: AuthenticationProtocol {
    func showMessage(title: String?, message: String?) {
        self.showAlert(title: title, message: message)
    }
    
    func goToNextStep() {
        self.navigationController?.pushViewController(SignUpAdditionalInfoVC(), animated: true)
    }
    
}
