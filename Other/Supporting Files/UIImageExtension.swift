//
//  UIImageExtension.swift
//  Other
//
//  Created by Serkan Özdemir on 20.12.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import Foundation
import UIKit
import Cartography

// MARK: Create Disclosure ImageView
extension UIImageView {
    static func createDisclosure() -> UIImageView {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "right_arrow")
        view.contentMode = .scaleAspectFit
        constrain(view) { $0.width == 6 }
        return view
        
    }
                       
}
