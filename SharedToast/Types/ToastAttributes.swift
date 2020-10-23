//
//  ToastAttributes.swift
//  Business
//
//  Created by Daulet Almagambetov on 8/11/20.
//  Copyright © 2020 AO Alfa-Bank. All rights reserved.
//

import SwiftEntryKit

public enum ToastAttributes {
    
    // MARK: - Constants
    public enum Constants {
        public enum Toast {
            public static let height: CGFloat = 56
            public static let horizontalOffset: CGFloat = 12
        }
        public static let infoDisplayDuration: Double = 2
        public static let errorDisplayDuration: Double = 5
        public static let noInternetEntryName = "no_internet_entry_name"
    }
    
    public enum Reachability {
        
        // MARK: - Reachability Properties
        public static var noInternet: EKAttributes = {
            var attributes = commonAttributes
            
            attributes.displayDuration = .infinity
            attributes.precedence.priority = .high
            attributes.name = Constants.noInternetEntryName
            
            return attributes
        }()

        public static var hasInternet: EKAttributes = {
            var attributes = commonAttributes
            
            attributes.displayDuration = Constants.infoDisplayDuration
            attributes.precedence = .override(priority: .high, dropEnqueuedEntries: false)
            
            return attributes
        }()
        
    }
    
    // MARK: - Public Static Properties
    public static var error: EKAttributes = {
        var attributes = commonAttributes
        
        attributes.displayDuration = Constants.errorDisplayDuration
        attributes.precedence.priority = .normal
        
        return attributes
    }()
    
    public static var info: EKAttributes = {
        var attributes = commonAttributes
        
        attributes.displayDuration = Constants.infoDisplayDuration
        attributes.precedence.priority = .low
        
        return attributes
    }()
    
    // MARK: - Private Static Properties
    private static var commonAttributes: EKAttributes = {
        var attributes = EKAttributes.topNote
        
        attributes.statusBar = .light
        attributes.precedence.priority = .low
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: false)
        attributes.positionConstraints.size = .init(width: .offset(value: Constants.Toast.horizontalOffset),
                                                    height: .constant(value: Constants.Toast.height))
        attributes.roundCorners = .all(radius: 4)
        attributes.precedence = .enqueue(priority: .normal)
        
        return attributes
    }()
    
}
