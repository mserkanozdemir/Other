//
//  SliderTableViewCell.swift
//  Other
//
//  Created by Serkan Özdemir on 16.01.2019.
//  Copyright © 2019 Serkan Özdemir. All rights reserved.
//

import UIKit
import Cartography

class SliderTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let cellTitle = UILabel.init()
        cellTitle.font = .systemFont(ofSize: 14.0)
        cellTitle.numberOfLines = 0
        return cellTitle
    }()
    
    private lazy var slider: UISwitch = {
        let slider = UISwitch.init()
        return slider
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(slider)
        
        constrain(titleLabel, slider) { label, onOffSwitch in
            label.left == label.superview!.left + 16
            label.top == label.superview!.top + 8
            label.bottom == label.superview!.bottom - 8
            label.right == label.superview!.right - 100 // for active label
            onOffSwitch.right == onOffSwitch.superview!.right - 8
            onOffSwitch.centerY == onOffSwitch.superview!.centerY
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateUI(with type: RowType) {
        titleLabel.text = type.rowName
        titleLabel.numberOfLines = 0
    }

}
