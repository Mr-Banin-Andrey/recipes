//
//  DateConverter.swift
//  Recipes
//
//  Created by Андрей Банин on 27.03.2025.
//

import Foundation

final class DateConverter {
    
    class func dateOnly(_ date: Date) -> Date {
        var calendar = Calendar.current
        calendar.timeZone = .current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        if let dateOnly = calendar.date(from: dateComponents) {
            return dateOnly
        }
        return Date()
    }
}
