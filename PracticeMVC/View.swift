//
//  View.swift
//  PracticeMVC
//
//  Created by 河明宗 on 2021/01/01.
//  Copyright © 2021 河明宗. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class MyView: UIView {
    let label = UILabel()
    let minusButton = UIButton()
    let plusButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.systemBlue, for: .normal)
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.systemBlue, for: .normal)
        
        addSubview(label)
        addSubview(minusButton)
        addSubview(plusButton)
    }
    
    private func setupConstraints() {
        self.snp.makeConstraints {
            $0.size.equalTo(100)
        }
        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        minusButton.snp.makeConstraints {
            $0.centerY.equalTo(label.snp.centerY)
            $0.right.equalTo(label.snp.left)
        }
        plusButton.snp.makeConstraints {
            $0.centerY.equalTo(label.snp.centerY)
            $0.left.equalTo(label.snp.right)
        }
    }
}
