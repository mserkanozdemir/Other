//
//  ListSectionHeaderView.swift
//  Other
//
//  Created by Serkan Özdemir on 14.11.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import Foundation
import UIKit

class ListSectionHeaderView: UIView {
    
    // MARK: - Properties
    private(set) lazy var titleLabel: UILabel = {
        let font: UIFont = .boldSystemFont(ofSize: 14.0)
        let label = UILabel.init()
    
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ListSectionHeaderView {
    func populate(with datasource: String) {
        titleLabel.text = datasource
        titleLabel.backgroundColor = .gray
}
}
