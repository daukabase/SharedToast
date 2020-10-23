//
//  InfoDisplayable.swift
//  Business
//
//  Created by Daulet Almagambetov on 8/6/20.
//  Copyright © 2020 AO Alfa-Bank. All rights reserved.
//

import SwiftEntryKit

public protocol InfoDisplayable {
    
}

public extension InfoDisplayable where Self: UIViewController {
    
    /**
     Displays notifications like banner with text information
        ### Display as following ###
     ````
      _______________
     |               |
     | some text     |
     |_______________|
     ````
     */
    func showInfo(with attributedText: NSAttributedString?) {
        let view = BaseBannerView()
        
        view.set(attributed: attributedText)
        view.isDisplayingError = false
        
        SwiftEntryKit.display(entry: view, using: ToastAttributes.info)
    }
    
    /**
     Displays notifications like banner with text information and check mark
        ### Display as following ###
     ````
      _______________
     |               |
     | some text   ✅|
     |_______________|
     ````
     */
    func showSuccess(with attributedText: NSAttributedString?) {
        let view = SuccessBannerView()
        
        view.set(attributed: attributedText)
        
        SwiftEntryKit.display(entry: view, using: ToastAttributes.info)
    }
    
}
