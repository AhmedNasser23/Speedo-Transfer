//
//  TextFieldHelper.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 07/09/2024.
//

import Foundation
import UIKit

struct TextFieldHelper {
    static func addRightIcon(to textField: UITextField, imageName: String) {
        let iconView = UIImageView(image: UIImage(systemName: imageName))
        iconView.tintColor = .gray
        iconView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 24))
        iconContainerView.addSubview(iconView)
        
        textField.rightView = iconContainerView
        textField.rightViewMode = .always
    }
}
