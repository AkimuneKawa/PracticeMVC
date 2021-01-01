//
//  Contoroller.swift
//  PracticeMVC
//
//  Created by 河明宗 on 2021/01/01.
//  Copyright © 2021 河明宗. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class ViewController: UIViewController {
    var myModel: Model? {
        didSet {
            registerModel()
        }
    }
    
    private(set) lazy var myView = MyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(myView)
    }
    
    private func setupConstraints() {
        myView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    deinit {
        myModel?.notificationCenter.removeObserver(self)
    }
    
    private func registerModel() {
        guard let model = myModel else { return }
        
        myView.label.text = model.count.description
        
        myView.minusButton.addTarget(
            self,
            action: #selector(onMinusTapped),
            for: .touchUpInside)
        myView.plusButton.addTarget(
            self,
            action: #selector(onPlusTapped),
            for: .touchUpInside)
        
        model.notificationCenter.addObserver(
            forName: .init("count"),
            object: nil,
            queue: nil,
            using: { [unowned self] notification in
                if let count = notification.userInfo?["count"] as? Int {
                    self.myView.label.text = "\(count)"
                }
        })
    }
    @objc func onMinusTapped() { myModel?.countDown() }
    @objc func onPlusTapped() { myModel?.countUp() }
}
