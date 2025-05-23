//
//  SignUpBasicInfoPresenter.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 07/09/2024.
//


import Foundation

class AuthenticationPresenter {
    
    // MARK: - Properties
    weak var view: AuthenticationProtocol!
    
    init(view: AuthenticationProtocol) {
        self.view = view
    }
    
    // MARK: - Methods
    func isValidData(name: String?, email: String?, password: String?, confirmedPassword: String?) -> Bool {
        guard let name = name?.trimmed, !name.isEmpty else {
            self.view.showMessage(title: "Sorry", message: "Please, Enter your name")
            return false
        }

        guard let email = email?.trimmed, !email.isEmpty else {
            self.view.showMessage(title: "Sorry", message: "Please, Enter your email")
            return false
        }

        guard let password = password?.trimmed, !password.isEmpty else {
            self.view.showMessage(title: "Sorry", message: "Please, Enter your password")
            return false
        }

        guard let confirmedPassword = confirmedPassword?.trimmed, !confirmedPassword.isEmpty else {
            self.view.showMessage(title: "Sorry", message: "Please, Confirm your password")
            return false
        }

        if password.count < 8 {
            self.view.showMessage(title: "Sorry", message: "Password must be at least 8 characters long")
            return false
        }

        let uppercaseCharSet = CharacterSet.uppercaseLetters
        if password.rangeOfCharacter(from: uppercaseCharSet) == nil {
            self.view.showMessage(title: "Sorry", message: "Password must contain at least 1 uppercase letter")
            return false
        }

        let lowercaseCharSet = CharacterSet.lowercaseLetters
        if password.rangeOfCharacter(from: lowercaseCharSet) == nil {
            self.view.showMessage(title: "Sorry", message: "Password must contain at least 1 lowercase letter")
            return false
        }

        let specialCharSet = CharacterSet(charactersIn: "!@#$%^&*()-_=+[]{}|;:'\",.<>?/`~")
        if password.rangeOfCharacter(from: specialCharSet) == nil {
            self.view.showMessage(title: "Sorry", message: "Password must contain at least 1 special character")
            return false
        }

        if password != confirmedPassword {
            self.view.showMessage(title: "Sorry", message: "Passwords do not match")
            return false
        }

        return true
    }

    
    func isConfimredPassword(password: String?, conPassowrd: String?) -> Bool {
       if password != conPassowrd {
           self.view.showMessage(title: "Sorry", message: "Mismathcing between passwords")
           return false
       }
       return true
   }
    
    func isValidData(country: String?, dateOfBirth: String?) -> Bool {
        guard let country = country?.trimmed, country.trimmed != "" else {
            self.view.showMessage(title: "Sorry", message: "Please, Choose your country")
            return false
        }
        guard let dateOfBirth = dateOfBirth?.trimmed, dateOfBirth.trimmed != "" else {
            self.view.showMessage(title: "Sorry", message: "Please, Enter your date of birth")
            return false
        }
        return true
    }
    
    func isValidData(email: String?, password: String?) -> Bool {
        guard let email = email?.trimmed, email.trimmed != "" else {
            self.view.showMessage(title: "Sorry", message: "Please, Enter your email")
            return false
        }
        guard let password = password?.trimmed, password.trimmed != "" else {
            self.view.showMessage(title: "Sorry", message: "Please, Enter your password")
            return false
        }
        return true
    }
}

extension AuthenticationPresenter: SignUpPresenterProtocol, LoginPresenterProtocol {
    func tryLogin(email: String!, password: String!) {
        if self.isValidData(email: email, password: password) {
            APIManager.login(loginRequestModel: LoginRequestModel(email: email, password: password)) { result in
                switch result {
                case .success():
                    print("Login successful, token saved in UserDefaults")
                    self.view.goToNextStep()
                case .failure(let error):
                    self.view.showMessage(title: "Sorry", message: "Login failed with error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func tryRegister(name: String, email: String, password: String, confirmedPassword: String) {
        if self.isValidData(name: name, email: email, password: password, confirmedPassword: confirmedPassword) {
            if self.isConfimredPassword(password: password, conPassowrd: confirmedPassword) {
                let userBasicData: UserBasicData = UserBasicData(name: name, email: email, password: password)
                userData = userBasicData
                self.view.goToNextStep()
            }
        }
    }
    
    func tryRegister(country: String, dateOfBirth: String) {
        if self.isValidData(country: country, dateOfBirth: dateOfBirth) {

            let userRequest: UserRequest = UserRequest(name: userData.name, email: userData.email, password: userData.password, country: country, dateOfBirth: DateConverter.convertDateFormat(dateString: dateOfBirth))
            
                APIManager.registerUser(user: userRequest) { result in
                    switch result {
                    case .success(let userResponse):
                        UserDefaultsManager.shared().userData = userResponse
                        print("User ID: \(userResponse.id)")
                        for account in userResponse.accounts {
                            print("Account Number: \(account.accountNumber)")
                            print("Balance: \(account.balance)")
                            print("Currency: \(account.currency)")
                            print("Account Name: \(account.accountName)")
                            print("----------------------")
                            self.view.goToNextStep()
                        }
                    case .failure(let error):
                        print("Error: \(error)")
                        self.view?.showMessage(title: "Sorry", message: error.localizedDescription)
                    }
                }
        }
    }
}
