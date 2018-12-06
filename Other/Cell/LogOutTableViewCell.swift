//
//  LogOutTableViewCell.swift
//  Other
//
//  Created by Serkan Özdemir on 3.12.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import UIKit

class LogOutTableViewCell: UITableViewCell {

    private lazy var titleLabel: UILabel = {
        let cellTitle = UILabel.init()
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.text = "Güvenli Çıkış"
        cellTitle.textAlignment = .center
        cellTitle.textColor = .red
        cellTitle.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return cellTitle
    }()
    
    private(set) lazy var bottomLine: UIView = {
        let bottomSeparator = UIView.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height - 0.5, width: UIScreen.screenWidth, height: 0.5))
        bottomSeparator.backgroundColor = #colorLiteral(red: 0.784, green: 0.780, blue: 0.800, alpha: 1.00)
        bottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        bottomSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return bottomSeparator
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(titleLabel)
        self.addSubview(bottomLine)
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        bottomLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true

}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
}
}
