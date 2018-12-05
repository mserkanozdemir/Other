//
//  OtherCell.swift
//  Other
//
//  Created by Serkan Özdemir on 3.12.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import UIKit

class OtherCell: UITableViewCell {
    
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
        cellTitle.font = UIFont(name: "Helvetica", size: 14)
        return cellTitle
    }()
    
    private lazy var disclosureIndicator: UIImageView = {
        let rightImage = UIImageView.init()
        rightImage.image = #imageLiteral(resourceName: "right_arrow")
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        rightImage.widthAnchor.constraint(equalToConstant: 6).isActive = true
        rightImage.contentMode = .scaleAspectFit
        return rightImage
    }()
    
    private lazy var baseStackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [icon, titleLabel, disclosureIndicator])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        self.addSubview(icon)
//        self.addSubview(titleLabel)
//        self.addSubview(disclosureIndicator)
        addSubview(baseStackView)
        
        
        baseStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        baseStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        baseStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        baseStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populateUI(with type: RowType) {
        icon.image = type.icon
        titleLabel.text = type.rowName
        icon.isHidden = type.icon == nil
    }

}
