//
//  OtherCell.swift
//  Other
//
//  Created by Serkan Özdemir on 3.12.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import UIKit
import Cartography

class OtherCell: UITableViewCell {
    
    private lazy var icon: UIImageView = {
        let iconImage = UIImageView.init()
        iconImage.contentMode = .scaleAspectFit
        constrain(iconImage) {
            $0.width == 20
            $0.height == 20
        }
        return iconImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let cellTitle = UILabel.init()
        cellTitle.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return cellTitle
    }()
    
    private lazy var badge: UILabel = {
        let badgeLabel = UILabel.init()
        badgeLabel.textColor = .white
        badgeLabel.backgroundColor = .red
        badgeLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        badgeLabel.textAlignment = .center
        constrain(badgeLabel) {
            $0.width == 20
            $0.height == 20
        }
        return badgeLabel
    }()
    
    private(set) lazy var space = UIView()
    
    private lazy var disclosureIndicator: UIImageView = {
        let rightImage = UIImageView.init()
        rightImage.image = #imageLiteral(resourceName: "right_arrow")
        constrain(rightImage) { $0.width == 6 }
        rightImage.contentMode = .scaleAspectFit
        return rightImage
    }()
    
    private lazy var baseStackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [icon, titleLabel, badge, space, disclosureIndicator])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(baseStackView)
        
        constrain(baseStackView) {
            $0.trailing ==  $0.superview!.trailing - 16
            $0.top ==  $0.superview!.top + 8
            $0.bottom ==  $0.superview!.bottom - 8
            $0.leading ==  $0.superview!.leading + 16
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populateUI(with type: RowType) {
        icon.image = type.icon
        titleLabel.text = type.rowName
        icon.isHidden = type.icon == nil
        badge.isHidden = type.badge == nil
        badge.text = type.badge
        self.layoutIfNeeded()
        badge.layer.masksToBounds = true
        badge.layer.cornerRadius = badge.frame.size.width / 2
        
    }

}
