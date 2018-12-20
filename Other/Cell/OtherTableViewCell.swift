//
//  OtherTableViewCell.swift
//  Other
//
//  Created by Serkan Özdemir on 3.12.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import UIKit
import Cartography

class OtherTableViewCell: UITableViewCell {
    
    private lazy var icon: UIImageView = {
        let iconImage = UIImageView.init()
        iconImage.contentMode = .scaleAspectFit
        return iconImage
    }()
    
    private lazy var titleLabel = UILabel()
    
    private lazy var disclosureIndicator: UIImageView = {
        let rightImage = UIImageView.init()
        rightImage.image = #imageLiteral(resourceName: "right_arrow")
        return rightImage
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(icon)
        self.addSubview(titleLabel)
        self.addSubview(disclosureIndicator)
        
        constrain(icon, titleLabel, disclosureIndicator) { image, label, indicator in
            image.trailing == label.leading - 16
            image.top == image.superview!.top + 8
            image.bottom == image.superview!.bottom - 8
            image.leading == image.superview!.leading + 16
            image.height == 20
            image.width == 20
            label.trailing == indicator.leading - 4
            label.centerY == label.superview!.centerY
            indicator.trailing == indicator.superview!.trailing - 16
            indicator.centerY == indicator.superview!.centerY
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populateUI(with type: RowType) {
        icon.image = type.icon
        titleLabel.text = type.rowName
    }
    
}
