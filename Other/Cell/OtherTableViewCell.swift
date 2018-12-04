//
//  OtherTableViewCell.swift
//  Other
//
//  Created by Serkan Özdemir on 3.12.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import UIKit

class OtherTableViewCell: UITableViewCell {
    
    private lazy var icon: UIImageView = {
        let iconImage = UIImageView.init()
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconImage.contentMode = .scaleAspectFit
        return iconImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let cellTitle = UILabel.init()
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        return cellTitle
    }()
    
    private lazy var disclosureIndicator: UIImageView = {
        let rightImage = UIImageView.init()
        rightImage.image = #imageLiteral(resourceName: "right_arrow")
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        return rightImage
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(icon)
        self.addSubview(titleLabel)
        self.addSubview(disclosureIndicator)
        
        icon.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -16).isActive = true
        icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        icon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        
        
        
        titleLabel.trailingAnchor.constraint(equalTo: disclosureIndicator.leadingAnchor, constant: -4).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        disclosureIndicator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        disclosureIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populateUI(with type: RowType) {
        icon.image = type.icon
        titleLabel.text = type.rowName
        
    }
    
}
