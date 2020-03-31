//
//  SleepTimerController.swift
//  Boosters
//
//  Created by Danylo Bulanov on 3/29/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

class SleepTimerController: UIAlertController {
    
    private let items: [SleepTimerType]
    var handler: ((SleepTimerType) -> Void)?
    
    override var preferredStyle: UIAlertController.Style {
        .actionSheet
    }
    
    init(items: SleepTimerType...) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
        addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        let items = self.items
        for item in items {
            let action = UIAlertAction(title: item.title, style: .default) { [weak self] (action) in
                self?.handler?(item)
            }
            addAction(action)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        addAction(cancelAction)
    }
}
