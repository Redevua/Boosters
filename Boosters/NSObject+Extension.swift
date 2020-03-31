//
//  NSObject+Extension.swift
//  Boosters
//
//  Created by Danylo Bulanov on 3/29/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import Foundation

extension NSObject: Configurable {}

protocol Configurable: AnyObject {}

extension Configurable {
    
    func then(_ configure: (Self) throws -> Void) rethrows -> Self {
        try configure(self)
        return self
    }
}
