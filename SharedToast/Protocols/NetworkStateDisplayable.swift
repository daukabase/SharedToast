//
//  ReachabilityDisplayable.swift
//  Business
//
//  Created by Daulet Almagambetov on 8/11/20.
//  Copyright © 2020 AO Alfa-Bank. All rights reserved.
//

import SwiftEntryKit
import UIKit

// MARK: - Constants
fileprivate enum NetworkDisplayConstants {
    static let displayingViewId = "alfa_business_network_display_view_accessibility_identifier"
    static let hidingAnimationDuration: Double = 0.5
}

public protocol NetworkStateDisplayable {
    
}

public extension NetworkStateDisplayable where Self: UIViewController {
    
    // MARK: - Public Methods
    func showNoInternet(attributedMessage: NSAttributedString?) {
        let view = NoInternetBannerView()
        view.set(attributed: attributedMessage)
        
        handleDisplay(of: view, using: ToastAttributes.Reachability.noInternet)
    }
    
    func showHasInternet(attributedMessage: NSAttributedString?) {
        let view = SuccessBannerView()
        view.set(attributed: attributedMessage)
        
        handleDisplay(of: view, using: ToastAttributes.Reachability.hasInternet)
    }
    
    // MARK: - Private Methods
    private func handleDisplay(of view: UIView, using attributes: EKAttributes) {
        SwiftEntryKit.display(entry: view, using: attributes)
    }
    
}
