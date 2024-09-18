//
//  DateConverter.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 18/09/2024.
//

import Foundation

struct DateConverter {
    static func convertDateFormat(dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "MMM d, yyyy"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = inputFormatter.date(from: dateString) else { return "N/A" }
        let formattedDate = outputFormatter.string(from: date)
        return formattedDate
    }
}
