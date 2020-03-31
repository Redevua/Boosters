//
//  MainView.swift
//  Boosters
//
//  Created by Danil on 3/29/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

struct Colors {
    static let basicBlue: UIColor = UIColor(red: 14.0/255, green: 122.0/255, blue: 254.0/255, alpha: 1.0)
    static let basicGray: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
}

protocol MainViewProtocol {
    var controlButton: MediaControlButton { get }
    var tableView: UITableView { get}
    var datePicker: UIDatePicker { get }
    var pickerHandler: ((Date) -> ())? { get set }
    
    func showPicker()
    func hiddenPicker(withResult isResult: Bool)
}

class MainView: UIView, MainViewProtocol {
    let datePicker: UIDatePicker = UIDatePicker()
    let controlButton: MediaControlButton = MediaControlButton().then {
        let bgColor = Colors.basicBlue
        $0.layer.cornerRadius = 4
        $0.setBackgroundColor(bgColor, for: .normal)
        $0.setBackgroundColor(bgColor.withAlphaComponent(0.8), for: .highlighted)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 16)
    }
    let tableView: UITableView = UITableView()
    var pickerHandler: ((Date) -> ())?
    private let keyInputView: KeyInputView = KeyInputView()
    private let line = UIView().then {
        $0.backgroundColor = Colors.basicGray
    }
    private let titleLabel: UILabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 22)
        $0.textColor = .black
        $0.text = "Playing"
    }
    private var isShowPicker: Bool = false
    
    init() {
        super.init(frame: .zero)
        addElements()
        configure()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapView))
        addGestureRecognizer(gesture)
    }
    
    private func configure() {
        backgroundColor = .white
        tableView.register(TimeCell.self, forCellReuseIdentifier: "TimeCell")
        tableView.bounces = false
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        datePicker.datePickerMode = .time
        datePicker.locale = Locale.current
        keyInputView.inputView = datePicker
    }
    
    private func addElements() {
        addAutolayoutSubviews(line, tableView, titleLabel, controlButton)
        addSubview(keyInputView)
        titleLabel
            .toSuper(.centerX)
            .toSuper(.top, constant: 72 + UIView.keyWindowSafeAreaInsets.top)
        controlButton
            .size(height: 52)
            .toSuper(.leading, constant: 24)
            .toSuper(.trailing, constant: -24)
            .toSuper(.bottom, constant: -36 - UIView.keyWindowSafeAreaInsets.bottom)
        tableView
            .anchor(.top, to: titleLabel, anchor: .bottom, constant: 12)
            .anchor(.bottom, to: line, anchor: .top)
            .toSuper(.leading, constant: 12)
            .toSuper(.trailing, constant: -12)
        line
            .toSuper(.leading, constant: 24)
            .toSuper(.trailing, constant: -24)
            .anchor(.bottom, to: controlButton, anchor: .top, constant: -28)
            .size(height: 1)
    }
    
    func showPicker() {
        isShowPicker = true
        keyInputView.becomeFirstResponder()
    }
    
    func hiddenPicker(withResult isResult: Bool = false) {
        isShowPicker = false
        keyInputView.resignFirstResponder()
        if isResult {
            pickerHandler?(datePicker.date)
        }
    }
    
    @objc private func tapView() {
        if isShowPicker {
            hiddenPicker()
        }
    }
}


