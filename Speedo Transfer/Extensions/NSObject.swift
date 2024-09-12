//
//  NSObject.swift
//  zaher
//
//  Created by Mohamed on 11/09/2024.
//

import Foundation

extension NSObject {
    
    public var className: String {
        return type(of: self).className
    }

    public static var className: String {
        return String(describing: self)
    }
    
}
