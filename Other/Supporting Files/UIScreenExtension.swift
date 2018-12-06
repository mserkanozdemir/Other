//
//  UIScreenExtension.swift
//  Other
//
//  Created by Serkan Özdemir on 5.12.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    
    class var orientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }
    
    class var screenWidth: CGFloat {
        return UIInterfaceOrientation.portrait.isPortrait ? screenSize.width : screenSize.height
    }
    
    class var screenHeight: CGFloat {
        return UIInterfaceOrientation.portrait.isPortrait ? screenSize.height : screenSize.width
    }
    
    private class var screenSize: CGSize {
        let frame = UIApplication.shared.keyWindow?.frame
        let size = CGSize(width: frame?.width ?? 0, height: frame?.height ?? 0)
        return size
    }
}
