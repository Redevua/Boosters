//
//  MainViewController.swift
//  Boosters
//
//  Created by Danil on 3/29/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let contentView: UIView & MainViewProtocol
    
    init(contentView: UIView & MainViewProtocol) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("helllo")
    }
}
