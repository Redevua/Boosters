//
//  UIToolbar+Extension.swift
//  Boosters
//
//  Created by Danil on 3/31/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

extension UIToolbar {
    
    func createToolbar(withCancelSelector cancelSelector: Selector? = nil, andWithDoneSelector doneSelector: Selector? = nil) -> UIToolbar {
        let titleLabel = UILabel().then {
            $0.text = "Alarm"
            $0.textColor = .black
            $0.font = UIFont.monospacedDigitSystemFont(ofSize: $0.font.pointSize, weight: .semibold)
        }
        let doneButton = UIButton().then {
            if let doneSelector = doneSelector {
                $0.addTarget(self, action: doneSelector, for: .touchUpInside)
            }
            $0.titleLabel?.font = .boldSystemFont(ofSize: 17)
            $0.setTitleColor(Colors.basicBlue, for: .normal)
            $0.setTitle("Done", for: .normal)
            
        }
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height:  50))
        toolbar.barStyle = UIBarStyle.default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: cancelSelector),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(customView: titleLabel),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(customView: doneButton)
        ]
        toolbar.sizeToFit()
        return toolbar
    }
}
