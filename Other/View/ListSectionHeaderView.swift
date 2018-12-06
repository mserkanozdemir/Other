//
//  ListSectionHeaderView.swift
//  Other
//
//  Created by Serkan Özdemir on 14.11.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import Foundation
import UIKit

class ListSectionHeaderView: UIView {
    
    // MARK: - Properties
    private(set) lazy var topLine: UIView = {
        let topSeparator = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.screenWidth, height: 0.5))
        topSeparator.backgroundColor = #colorLiteral(red: 0.784, green: 0.780, blue: 0.800, alpha: 1.00)
        topSeparator.translatesAutoresizingMaskIntoConstraints = false
        topSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return topSeparator
    }()
    
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        
        return label
    }()
    
    private(set) lazy var bottomLine: UIView = {
        let bottomSeparator = UIView.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height - 0.5, width: UIScreen.screenWidth, height: 0.5))
        bottomSeparator.backgroundColor = #colorLiteral(red: 0.784, green: 0.780, blue: 0.800, alpha: 1.00)
        bottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        bottomSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return bottomSeparator
    }()
    
    
    private lazy var baseStackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [topLine, titleLabel, bottomLine])
        self.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 6
        return stackView
    }()
    
    
    init() {
        super.init(frame: .zero)
        addSubview(baseStackView)
        baseStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        baseStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        baseStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        baseStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ListSectionHeaderView {
    func populate(with datasource: String) {
        titleLabel.text = datasource
        titleLabel.textColor = #colorLiteral(red: 0.588, green: 0.588, blue: 0.588, alpha: 1.00)
}
}

