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
        
        self.setUpScreen()
    }
    
    // MARK: - Actions
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
//        self.presenter.tryRegister?(name: fullNameTextField.text, email: emailTextField.text, password: passwordTextField.text, confirmedPassword: confirmedPasswordTextField.text)
        
        let user = UserSendedData(
            name: "Ahmed Gad",
            email: "A1234567891011121314202015.gd@gmail.com",
            password: "Ahmed@1234",
            dateOfBirth: "2004-09-11",
            country: "Egypt",
            phoneNumber: "01120238010"
        )

        APIManager.register(user: user) { result in
            switch result {
            case .success(let userRecivedData):
                print("Sucesss")
                print("Registration successful: \(userRecivedData)")
            case .failure(let error):
                print("Fail")
                print("Registration failed with error: \(error.localizedDescription)")
            }
        }
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
