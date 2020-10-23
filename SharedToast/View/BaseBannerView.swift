//
//  BaseBannerView.swift
//  Business
//
//  Created by Daulet Almagambetov on 7/23/20.
//  Copyright © 2020 AO Alfa-Bank. All rights reserved.
//

import UIKit

public class BaseBannerView: UIView {

    // MARK: - Properties
    public var isDisplayingError = false {
        didSet {
            configureFlag()
        }
    }
    
    // MARK: - Views
    private lazy var messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 3
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        
        return label
    }()
    
    private lazy var flagView = UIView()
    
    public lazy var rightActionView: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.must, for: .horizontal)
        return view
    }()
    
    // MARK: - Init
    public init() {
        super.init(frame: .zero)
        
        commonInit()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func set(attributed text: NSAttributedString?) {
        messageLabel.attributedText = text
    }

    // MARK: - Configurations
    public func commonInit() {
        [flagView, messageLabel, rightActionView].forEach(addSubview)
        
        setupConstraints()
        isDisplayingError = { isDisplayingError }()
        
        backgroundColor = Colors.uiBackground
        clipsToBounds = true
        layer.cornerRadius = 4
        layer.masksToBounds = true
    }
    
    public func removeLabelRightOffset() {
        messageLabel.snp.updateConstraints { make in
            make.right.equalTo(rightActionView.snp.left)
        }
    }

}

private extension BaseBannerView {
    
    // MARK: - Private Setup
    func setupConstraints() {
        flagView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(4)
        }
        messageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(flagView.snp.right).offset(16)
            make.right.equalTo(rightActionView.snp.left).offset(-16)
        }
        rightActionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(0).priority(.low)
        }
    }
        
    func configureFlag() {
        flagView.backgroundColor = isDisplayingError ? Colors.uiRed : Colors.uiGreenSuccess
    }
    
}
