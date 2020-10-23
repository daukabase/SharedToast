//
//  Styles.swift
//  SharedToast
//
//  Created by Daulet Almagambetov on 10/23/20.
//

import UIKit

typealias Images = Styles.Images

// MARK: - Global Properties
internal var styles: Styles = .init()


// MARK: - Styles
public struct Styles {
    
    // MARK: - Nested Types
    public struct Images {
        public static let `default` = Images(loadIndicator: UIImage(named: "loadIndicator"),
                                             success: UIImage(named: "success"))
        
        public let loadIndicator: UIImage?
        public let success: UIImage?
    }
    
    public struct Colors {
        public static let `default` = Colors(uiBackground: UIColor(hexString: "#F3F4F5"),
                                             uiRed: UIColor(hexString: "#F0453A"),
                                             uiGreenSuccess: UIColor(hexString: "0DBA26"))
        
        public let uiBackground: UIColor
        public let uiRed: UIColor
        public let uiGreenSuccess: UIColor
    }
    
    internal let images: Images
    internal let colors: Colors
    internal let retryErrorAttributedText: NSAttributedString?
    
    public init(images: Images = .default,
         colors: Colors = .default,
         retryErrorAttributedText: NSAttributedString? = nil
    ) {
        self.images = images
        self.colors = colors
        self.retryErrorAttributedText = retryErrorAttributedText
    }
    
}
