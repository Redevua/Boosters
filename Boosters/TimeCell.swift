//
//  TimeCell.swift
//  Boosters
//
//  Created by Danil on 3/31/20.
//  Copyright © 2020 com.com. All rights reserved.
//

import UIKit

enum TimeCellType {
    case timer
    case alarm
    case none
}

struct TimeCellViewModel {
    let title: String
    let timeTitle: String
    let type: TimeCellType
    
    func with(timeTitle: String) -> TimeCellViewModel {
        return .init(title: title, timeTitle: timeTitle, type: type)
    }
}

protocol TimeCellDelegate: class {
    func time(cell: TimeCell, didSelectForModel model: TimeCellViewModel)
}

class TimeCell: UITableViewCell {
    
    private let title: UILabel = UILabel().then {
        $0.textColor = .darkText
        $0.font = .systemFont(ofSize: 16)
    }
    private let time: UILabel = UILabel().then {
        $0.textColor = Colors.basicBlue
        $0.font = .boldSystemFont(ofSize: 16)
    }
    private let line = UIView().then {
        $0.backgroundColor = Colors.basicGray
    }
    private var action: UIButton = UIButton()
    private var viewModel: TimeCellViewModel?
    
    weak var delegate: TimeCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        configure()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        selectionStyle = .none
        transform = CGAffineTransform(scaleX: 1, y: -1)
        action.backgroundColor = .clear
    }
    
    func configure(model: TimeCellViewModel) {
        title.text = model.title
        time.text = model.timeTitle
        viewModel = model
    }
    
    private func bind() {
        action.addTarget(self, action: #selector(selectedCell), for: .touchUpInside)
    }
    
    private func addElements() {
        addAutolayoutSubviews(title, time, line, action)
        line
            .toSuper(anchors: .top)
            .toSuper(.leading, constant: 12)
            .toSuper(.trailing, constant: -12)
            .size(height: 1)
        title
            .toSuper(.leading, constant: 12)
            .toSuper(.centerY)
        time
            .toSuper(.trailing, constant: -12)
            .toSuper(.centerY)
        action.toSuperEdges()
    }
    
    @objc private func selectedCell() {
        guard let model = viewModel else {
            return
        }
        delegate?.time(cell: self, didSelectForModel: model)
    }
}
