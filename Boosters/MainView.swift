//
//  MainView.swift
//  Boosters
//
//  Created by Danil on 3/29/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import Foundation

protocol MainViewProtocol {
    
}

class MainView: UIView, MainViewProtocol {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

