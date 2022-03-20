//
//  TopView.swift
//  UIKitExamples
//
//  Created by Suren Kazaryan on 18.03.2022.
//

import UIKit

class TopView: UIView {
    var callback: (()->Void)?
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBrown
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    lazy var openCloseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close", for: .normal)
        button.addTarget(self, action: #selector(openClose), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openClose() {
        callback?()
    }
    
}

//MARK: - Private methods
extension TopView {
    private func setupView() {
        self.addSubview(topView)
        topView.addSubview(titleLabel)
        topView.addSubview(openCloseButton)
        
        NSLayoutConstraint.activate([

            topView.topAnchor.constraint(equalTo: self.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5),

            openCloseButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 5),
            openCloseButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
            openCloseButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5)
        ])
    }
}
