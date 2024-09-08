//
//  UIColor+Gradient.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 06/09/2024.
//

import Foundation

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let hexFormatted: String = hex
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func setupBackgroundColor(for view: UIView, topColor: UIColor = UIColor(hex: "FFFFFF"), bottomColor: UIColor = UIColor(hex: "FFFFFF")) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [
            topColor.cgColor,
            bottomColor.cgColor
        ]
        
        gradientLayer.locations = [0.0, 0.5, 1.0]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
