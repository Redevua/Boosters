//
//  UIButton+Extension.swift
//  Boosters
//
//  Created by Danylo Bulanov on 3/29/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

extension UIButton {

    private func image(withColor color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(image(withColor: color), for: state)
        self.clipsToBounds = true
    }
}

