//
//  TextFieldTableViewCell.swift
//  Other
//
//  Created by Serkan Özdemir on 14.01.2019.
//  Copyright © 2019 Serkan Özdemir. All rights reserved.
//

import UIKit
import Cartography
import SkyFloatingLabelTextField

class TextFieldTableViewCell: UITableViewCell {
    
    private let textField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.titleColor = .gray
        textField.titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        textField.selectedTitleColor = .darkGray
        textField.placeholderColor = .black
        textField.returnKeyType = .next
        textField.titleFormatter = { (text: String) -> String in
            return text.capitalized(with: Locale.current)
        }
        constrain(textField) { $0.height == 45 }
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(textField)
        constrain(textField, block: {
            $0.leading == $0.superview!.leading + 16
            $0.trailing == $0.superview!.trailing - 16
            $0.top == $0.superview!.top + 5
            $0.bottom == $0.superview!.bottom - 5
        })
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
        textField.placeholder = type.rowName
        textField.title = type.rowName
    }
}
