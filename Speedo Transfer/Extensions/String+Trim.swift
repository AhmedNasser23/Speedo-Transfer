//
//  String+Trim.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 07/09/2024.
//

import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
