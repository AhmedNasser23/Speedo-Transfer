//
//  AuthenticationProtocol.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 07/09/2024.
//

import Foundation

protocol AuthenticationProtocol: AnyObject {
    func showMessage(title: String?, message: String?)
    func goToNextStep()
}

@objc protocol SignUpPresenterProtocol {
    @objc optional func tryRegister(name: String, email: String, password: String, confirmedPassword: String)
    
    @objc optional func tryRegister(country: String, dateOfBirth: String)
}

protocol LoginPresenterProtocol {
    func tryLogin(email: String, password: String)
}
