//
//  TextFieldTableViewCell.swift
//  Other
//
//  Created by Serkan Özdemir on 14.01.2019.
//  Copyright © 2019 Serkan Özdemir. All rights reserved.
//

import UIKit
import Cartography

class TextFieldTableViewCell: UITableViewCell {
    
    private let usernameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameTextField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(usernameTextField)
        constrain(usernameTextField, block: {
            $0.leading == $0.superview!.leading
            $0.trailing == $0.superview!.trailing
            $0.top == $0.superview!.top
            $0.bottom == $0.superview!.bottom
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

}
