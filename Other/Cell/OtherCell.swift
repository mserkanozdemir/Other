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
        cellTitle.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return cellTitle
    }()
    
    private lazy var badge: UILabel = {
        let badgeLabel = UILabel.init()
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        badgeLabel.textColor = .white
        badgeLabel.backgroundColor = .red
        badgeLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        badgeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        badgeLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        badgeLabel.textAlignment = .center
        return badgeLabel
    }()
    
    private(set) lazy var space: UIView = {
        let spaceView = UIView.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height - 0.5, width: UIScreen.screenWidth, height: 0.5))
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        return spaceView
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
        let stackView = UIStackView.init(arrangedSubviews: [icon, titleLabel, badge, space, disclosureIndicator])
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        badge.isHidden = type.badge == nil
        badge.text = type.badge
        self.layoutIfNeeded()
        badge.layer.masksToBounds = true
        badge.layer.cornerRadius = badge.frame.size.width / 2
        
    }

}
