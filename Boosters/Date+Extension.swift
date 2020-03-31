//
//  Date+Extension.swift
//  Boosters
//
//  Created by Danil on 3/31/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import Foundation

extension Date {
    
    private static var formatter: DateFormatter {
        DateFormatter()
    }
    
    var formatTime: String {
        let formatter = Date.formatter
        formatter.locale = Locale.current
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        return formatter.string(from: self)
    }
}
