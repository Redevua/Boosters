//
//  MediaControlButton.swift
//  Boosters
//
//  Created by Danylo Bulanov on 3/29/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

class MediaControlButton: UIButton {
    
    enum ControlState {
        case play
        case pause
    }
    
    init(state: ControlState = .pause) {
        super.init(frame: .zero)
        self.configure(state: state)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(state: ControlState) {
        switch state {
        case .pause:
             setTitle("Play", for: .normal)
        case .play:
            setTitle("Pause", for: .normal)
        }
    }
}
