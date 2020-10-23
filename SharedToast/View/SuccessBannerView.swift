//
//  SuccessBannerView.swift
//  Business
//
//  Created by Daulet Almagambetov on 8/11/20.
//  Copyright © 2020 AO Alfa-Bank. All rights reserved.
//

import UIKit

final class SuccessBannerView: BaseBannerView {
    
    // MARK: - Views
    private lazy var successImageView: UIImageView = {
        let view = UIImageView(image: Asset.success)
        view.contentMode = .center
        return view
    }()
    
    // MARK: - BaseBannerView
    override func commonInit() {
        super.commonInit()
        
        isDisplayingError = false
        setupViews()
    }
    
    // MARK: - Private Setup
    private func setupViews() {
        rightActionView.addSubview(successImageView)
        
        successImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview().offset(-17)
            make.size.equalTo(24)
            make.centerY.equalToSuperview()
        }
    }
    
}
