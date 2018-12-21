//
//  ListSectionHeaderView.swift
//  Other
//
//  Created by Serkan Özdemir on 14.11.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import Foundation
import UIKit
import Cartography

class ListSectionHeaderView: UIView {
    // MARK: - Properties
    private(set) lazy var topLine: UIView = {
        let topSeparator = UIView.init()
        topSeparator.backgroundColor = #colorLiteral(red: 0.784, green: 0.780, blue: 0.800, alpha: 1.00)
        constrain(topSeparator) {
            $0.height == 1
        }
        return topSeparator
    }()
    
    private(set) lazy var space: UIView = {
        let spaceView = UIView.init()
        constrain(spaceView) {
            $0.width == 8
        }
        return spaceView
    }()

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = #colorLiteral(red: 0.588, green: 0.588, blue: 0.588, alpha: 1.00)
        label.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        return label
    }()

    private(set) lazy var bottomLine: UIView = {
        let bottomSeparator = UIView.init()
        bottomSeparator.backgroundColor = #colorLiteral(red: 0.784, green: 0.780, blue: 0.800, alpha: 1.00)
        constrain(bottomSeparator) {
            $0.height == 1
        }
        return bottomSeparator
    }()
    
    private lazy var titleStackView: UIStackView = {
        let titleStackView = UIStackView.init(arrangedSubviews: [space, titleLabel])
        titleStackView.axis = .horizontal
        titleStackView.distribution = .fill
        titleStackView.spacing = 8
        return titleStackView
    }()

    private lazy var baseStackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [topLine, titleStackView, bottomLine])
        self.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        addSubview(titleStackView)
        addSubview(baseStackView)
        
        constrain(baseStackView) {
            $0.trailing == $0.superview!.trailing
            $0.top == $0.superview!.top
            $0.bottom == $0.superview!.bottom
            $0.leading == $0.superview!.leading
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListSectionHeaderView {
    func populate(with datasource: String, showTopLine: Bool) {
        titleLabel.text = datasource
        topLine.isHidden = showTopLine
    }
}
