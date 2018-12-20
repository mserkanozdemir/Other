//
//  LogOutTableViewCell.swift
//  Other
//
//  Created by Serkan Özdemir on 3.12.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import UIKit
import Cartography

class LogOutTableViewCell: UITableViewCell {

    private lazy var titleLabel: UILabel = {
        let cellTitle = UILabel.init()
        cellTitle.text = "Güvenli Çıkış"
        cellTitle.textAlignment = .center
        cellTitle.textColor = .red
        cellTitle.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return cellTitle
    }()
    
    private(set) lazy var bottomLine: UIView = {
        let bottomSeparator = UIView.init()
        bottomSeparator.backgroundColor = #colorLiteral(red: 0.784, green: 0.780, blue: 0.800, alpha: 1.00)
        bottomSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return bottomSeparator
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(titleLabel)
        self.addSubview(bottomLine)
        
        constrain(titleLabel, bottomLine) { label, line in
            label.trailing == label.superview!.trailing - 16
            label.top == label.superview!.top + 8
            label.bottom == label.superview!.bottom - 8
            label.leading == label.superview!.leading + 16
            line.trailing == line.superview!.trailing
            line.top == label.bottom + 8
            line.leading == line.superview!.leading
        }

}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
}
}
