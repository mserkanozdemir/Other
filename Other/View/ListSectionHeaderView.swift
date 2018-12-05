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
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont(name: "Helvetica", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
    
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.addSubview(titleLabel)
        
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ListSectionHeaderView {
    func populate(with datasource: String) {
        titleLabel.text = datasource
        titleLabel.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        titleLabel.textColor = #colorLiteral(red: 0.588, green: 0.588, blue: 0.588, alpha: 1.00)
}
}

