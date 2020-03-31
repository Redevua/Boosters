//
//  SleepTimerType.swift
//  Boosters
//
//  Created by Danylo Bulanov on 3/29/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import Foundation

enum SleepTimerType {
    
    case off
    case oneMinute
    case twoMinutes
    case fiveMinutes
    case tenMinutes
    case fifteenMinutes
    case twentyMinutes
    
    var title: String {
        switch self {
        case .off: return "off"
        case .oneMinute: return "1 min"
        case .twoMinutes: return "2 min"
        case .fiveMinutes: return "5 min"
        case .tenMinutes: return "10 min"
        case .fifteenMinutes: return "15 min"
        case .twentyMinutes: return "20 min"
        }
    }
}
