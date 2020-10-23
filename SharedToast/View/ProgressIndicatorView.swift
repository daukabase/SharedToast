//
//  ProgressIndicatorView.swift
//  Business
//
//  Created by Daulet Almagambetov on 7/24/20.
//  Copyright © 2020 AO Alfa-Bank. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

// TODO: draw angle gradient in code instead of using image
final class ProgressIndicatorView: UIView, CAAnimationDelegate {

    // MARK: - Constants
    private enum Constants {
        static let duration: TimeInterval = 0.8
        static let preferredSize = CGSize(width: 24, height: 24)
        static let transformRotationKey = "transform.rotation"
    }
    
    // MARK: - Views
    private lazy var gradientCircleImageView: UIImageView = {
        let image = UIImageView(image: Asset.loadIndicator)
        image.contentMode = .center
        return image
    }()
    
    // MARK: - Internal Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIView
    override var intrinsicContentSize: CGSize {
        return Constants.preferredSize
    }
    
    // MARK: - Internal Methods
    func animate() {
        rotate(gradientCircleImageView)
    }
    
    func stopAnimation() {
        stopRotation(in: gradientCircleImageView)
    }
    
    // MARK: - Private Methods
    private func commonInit() {
        addSubview(gradientCircleImageView)
        
        gradientCircleImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    // MARK: - View Rotation
    private func rotate(_ view: UIView, with animationDuration: CFTimeInterval = Constants.duration) {
        let rotateAnimation = CABasicAnimation(keyPath: Constants.transformRotationKey)
        
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = -CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = animationDuration
        rotateAnimation.repeatCount = .infinity
        
        view.layer.add(rotateAnimation, forKey: nil)
    }
    
    private func stopRotation(in view: UIView) {
        view.layer.removeAnimation(forKey: Constants.transformRotationKey)
    }
    
}
