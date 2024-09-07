//
//  UIViewController+Alert+Toggle.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 07/09/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func addPasswordToggle(to textField: UITextField) {
        let passwordToggleButton = UIButton(type: .custom)
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.tintColor = .gray
        passwordToggleButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordVisibility(_:)), for: .touchUpInside)
        
        textField.isSecureTextEntry = true
        textField.rightView = passwordToggleButton
        textField.rightViewMode = .always
    }

    // Action to toggle password visibility
    @objc func togglePasswordVisibility(_ sender: UIButton) {
        sender.isSelected.toggle()
        if let textField = sender.superview as? UITextField {
            textField.isSecureTextEntry.toggle()
        }
    }
}
