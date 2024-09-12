//
//  UIView.swift
//  zaher
//
//  Created by Mohamed on 11/09/2024.
//

import UIKit

extension UIView {
    func dropShadow(scale: Bool = true,
                    opacity: Float = 1,
                    color: CGColor = UIColor.black.cgColor,
                    radius: CGFloat = 5) {
        layer.masksToBounds = false
        layer.shadowColor = color
        layer.shadowOpacity = opacity
        layer.shadowOffset = .zero
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
}
