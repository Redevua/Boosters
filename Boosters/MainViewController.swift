//
//  MainViewController.swift
//  Boosters
//
//  Created by Danil on 3/29/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var contentView: UIView & MainViewProtocol
    private let viewModel: MainViewModelProtocol
    private let sleepTimerController: SleepTimerController = SleepTimerController(
        items: .off, .oneMinute, .twoMinutes, .fiveMinutes, .tenMinutes, .fifteenMinutes, .twentyMinutes
    )
    
    override var inputAccessoryView: UIView? {
        return UIToolbar()
            .createToolbar(
                withCancelSelector: #selector(cancelAction),
                andWithDoneSelector: #selector(doneAction)
        )
    }
    
    init(contentView: UIView & MainViewProtocol, viewModel: MainViewModelProtocol) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    override func loadView() {
        view = contentView
    }
    
    private func bind() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.controlButton.addTarget(self, action: #selector(controlEventAction(_ :)), for: .touchUpInside)
    }
    
    @objc func controlEventAction(_ action: Any) {
        
    }
    
    @objc private func doneAction() {
        contentView.hiddenPicker(withResult: true)
    }
    
    @objc private func cancelAction() {
        contentView.hiddenPicker(withResult: false)
    }
}

//MARK: -UITableViewDataSource, UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCell") as! TimeCell
        cell.configure(model: viewModel.tableData[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        52.0
    }
}

//MARK: -TimeCellDelegate
extension MainViewController: TimeCellDelegate {
    func time(cell: TimeCell, didSelectForModel model: TimeCellViewModel) {
        switch model.type {
        case .alarm:
            contentView.pickerHandler = { date in
                cell.configure(model: model.with(timeTitle: date.formatTime))
            }
            contentView.showPicker()
        case .timer:
            sleepTimerController.handler = { item in
                cell.configure(model: model.with(timeTitle: item.title))
            }
            present(sleepTimerController, animated: true, completion: nil)
        case .none:
            fatalError()
        }
    }
}


