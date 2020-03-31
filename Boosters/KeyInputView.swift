//
//  KeyInputView.swift
//  Boosters
//
//  Created by Danil on 3/31/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

class KeyInputView: UIView {
    
    var _inputView: UIView?
    
    override var canBecomeFirstResponder: Bool { true }
    override var canResignFirstResponder: Bool { true }
    
    override var inputView: UIView? {
        set { _inputView = newValue }
        get { _inputView }
    }
}
