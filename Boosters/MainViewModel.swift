//
//  MainViewModel.swift
//  Boosters
//
//  Created by Danylo Bulanov on 3/29/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import Foundation

protocol MainViewModelProtocol {
    var tableData: [TimeCellViewModel] { get }
}

class MainViewModel: MainViewModelProtocol {
   
    var tableData: [TimeCellViewModel] = [
        TimeCellViewModel(title: "Sleep Timer", timeTitle: SleepTimerType.tenMinutes.title, type: .timer),
        TimeCellViewModel(title: "Alarm", timeTitle: Date().formatTime, type: .alarm)
    ]
    
}
