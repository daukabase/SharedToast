//
//  ErrorBannerView.swift
//  Business
//
//  Created by Daulet Almagambetov on 8/11/20.
//  Copyright © 2020 AO Alfa-Bank. All rights reserved.
//

import UIKit

final class ErrorBannerView: BaseBannerView {
    
    // MARK: - Properties
    var onRetry: (() -> Void)?
    
    private let isRetryable: Bool
    
    // MARK: - Views
    private lazy var retryButton: UIButton = {
        let view = UIButton()
        
        view.addTarget(self, action: #selector(didTapRetryButton), for: .touchUpInside)
        view.contentMode = .center
        view.showsTouchWhenHighlighted = true
        
        return view
    }()
    
    // MARK: - Init
    init(isRetryable: Bool) {
        self.isRetryable = isRetryable

        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(isRetryable: Bool, retry attributedText: NSAttributedString?) {
        self.isRetryable = isRetryable
        
        super.init()
        
        retryButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    // MARK: - BaseBannerView
    override func commonInit() {
        super.commonInit()
        
        isDisplayingError = true
        
        setupViews()
    }
    
    // MARK: - Private Setup
    private func setupViews() {
        guard isRetryable else {
            return
        }
        
        rightActionView.addSubview(retryButton)
        
        retryButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(95)
        }
        
        removeLabelRightOffset()
    }
    
    // MARK: - Private Actions
    @objc
    private func didTapRetryButton() {
        onRetry?()
    }
    
}
