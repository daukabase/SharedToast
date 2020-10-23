//
//  NoInternetBannerView.swift
//  Business
//
//  Created by Daulet Almagambetov on 7/24/20.
//  Copyright © 2020 AO Alfa-Bank. All rights reserved.
//

import UIKit

final class NoInternetBannerView: BaseBannerView {
    
    // MARK: - Views
    private lazy var activityIndicatorView = ProgressIndicatorView()
    
    // MARK: - BaseBannerView
    override func commonInit() {
        super.commonInit()
        
        isDisplayingError = true
        setupViews()
        activityIndicatorView.animate()
    }
    
    // MARK: - Private Setup
    private func setupViews() {
        rightActionView.addSubview(activityIndicatorView)
        
        activityIndicatorView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
            make.size.equalTo(24)
            make.centerY.equalToSuperview()
        }
    }
    
}
