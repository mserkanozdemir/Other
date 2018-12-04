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
        cellTitle.text = "Çıkış Yap"
        cellTitle.textAlignment = .center
        cellTitle.textColor = .red
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        return cellTitle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
