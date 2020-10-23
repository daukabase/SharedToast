//
//  ErrorDisplayable.swift
//  Business
//
//  Created by Daulet Almagambetov on 8/6/20.
//  Copyright © 2020 AO Alfa-Bank. All rights reserved.
//

import SwiftEntryKit

fileprivate enum ErrorConstants {
    private static let entryNamePrefix = "error_entry_name_"
    
    static func getEntryName(for controller: UIViewController) -> String {
        return entryNamePrefix + String(describing: controller)
    }
}

public protocol ErrorDisplayable {
    
}

public extension ErrorDisplayable where Self: UIViewController {
    
    // MARK: - Public Methods
    func showError(with attributedText: NSAttributedString?, onRetry: (() -> Void)? = nil) {
        let retryNeeded = onRetry != nil
        let view = ErrorBannerView(isRetryable: retryNeeded)
        
        view.set(attributed: attributedText)
        view.onRetry = {
            SwiftEntryKit.dismiss(.displayed, with: nil)
            onRetry?()
        }
        
        SwiftEntryKit.display(entry: view, using: getErrorAttributes(retryNeeded: retryNeeded))
    }
    
    /**
        Dismiss all errors displayed by current viewController
    */
    func dismissErrors() {
        SwiftEntryKit.dismiss(.specific(entryName: ErrorConstants.getEntryName(for: self)), with: nil)
    }
    
    // MARK: - Private Methods
    private func getErrorAttributes(retryNeeded: Bool) -> EKAttributes {
        var attributes = ToastAttributes.error
        attributes.name = ErrorConstants.getEntryName(for: self)
        return attributes
    }
    
}
